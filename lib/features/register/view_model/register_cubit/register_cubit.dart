import 'package:bloc/bloc.dart';
import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
    }).catchError((error) {
      if (error is DioException) {
        print(error.response!.data);
      }
      emit(RegisterFailedState());
    });
  }
}
