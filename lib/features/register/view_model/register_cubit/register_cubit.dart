import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_toast.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState>? formKey = GlobalKey();

  bool passwordIcon = true;
  bool confirmPasswordIcon = true;

  void changePasswordIcon() {
    passwordIcon = !passwordIcon;
    emit(
      CahngePasswordIconState(),
    );
  } void changeConfirmPasswordIcon() {
    confirmPasswordIcon = !confirmPasswordIcon;
    emit(
      CahngeConfirmPasswordIconState(),
    );
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    await DioHelper.post(
      url: EndPoints.register,
      data: {
        "name": nameController.text,
        "email": emailController.text,
        'password': passwordController.text,
        "password_confirmation": confirmPasswordController.text,
      },
    ).then((value) {
      print(value.data);
      emit(RegisterSuccessState());
      SharedPreference.setData(key: SharedPreferenceKey.token, value: value.data['data']['token']);
      SharedPreference.setData(key: SharedPreferenceKey.name, value: value.data['data']['user']['name']);
      showToast(message: value.data['message'], state: ToastState.success);

    }).catchError((error) {
      if (error is DioException) {
        showToast(message: error.response?.data['errors']['email'][0], state: ToastState.error);
        print(error.response!.data);
      }
      emit(RegisterFailedState());
    });
  }
}
