import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/network/dio_helper.dart';
import '../../../../core/services/network/end_points.dart';

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
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data);
      }
      emit(LoginFailedState());
    });
  }


}
