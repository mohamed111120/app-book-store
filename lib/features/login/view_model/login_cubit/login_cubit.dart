import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local/shared_helper.dart';
import '../../../../core/services/local/shared_keys.dart';
import '../../../../core/services/network/dio_helper.dart';
import '../../../../core/services/network/end_points.dart';
import '../../../../core/utils/widgets/custom_toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoadingState());
    await DioHelper.post(
      url: EndPoints.login,
      data: {
        "email": emailController.text,
        'password': passwordController.text,
      },
    ).then((value) {
      SharedPreference.setData(key: SharedPreferenceKey.token, value: value.data['data']['token']);
      SharedPreference.setData(key: SharedPreferenceKey.name, value: value.data['data']['user']['name']);

      print(value.data);
      showToast(message: value.data['message'], state: ToastState.success);
      emit(LoginSuccessState());
      emailController.clear();
      passwordController.clear();
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data);
        showToast(message: error.response!.data['message'], state: ToastState.error);
      }

      emit(LoginFailedState());
    });
  }


}
