import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/home_layout/view/home_layout.dart';
import 'package:book_store/features/login/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/custom_navigator.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primary, width: 2)),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: LoginCubit.get(context).emailController,
              padding: 5,
              prefixIcon: const Icon(
                Icons.email,
                size: 30,
              ),
              lable: 'Email',
            ),
            CustomTextFormField(
              controller: LoginCubit.get(context).passwordController,
              padding: 5,
              prefixIcon: const Icon(
                Icons.lock,
                size: 30,
              ),
              suffixIcon: const Icon(
                Icons.password,
                size: 30,
              ),
              lable: 'Password',
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if(state is LoginSuccessState){
                  CustomNavigator.pushAndRemoveUntil(context, const HomeLayout());

                }
              },
              child: CustomButton(
                onPressed: () {
                  LoginCubit.get(context).login();
                },
                text: 'Login',
                textColor: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
