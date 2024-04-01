import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/home_layout/view/home_layout.dart';
import 'package:book_store/features/register/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/custom_navigator.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primary, width: 2)),
      child: Form(
        child: Column(
          children: [
            CustomTextFormField(
              controller: RegisterCubit.get(context).nameController,
              padding: 5,
              prefixIcon: Icon(
                Icons.person,
                size: 30,
              ),
              lable: 'Name',
            ),
            CustomTextFormField(
              controller: RegisterCubit.get(context).emailController,
              padding: 5,
              prefixIcon: Icon(
                Icons.email,
                size: 30,
              ),
              lable: 'Email',
            ),
            CustomTextFormField(
              controller: RegisterCubit.get(context).passwordController,
              padding: 5,
              prefixIcon: Icon(
                Icons.lock,
                size: 30,
              ),
              suffixIcon: Icon(
                Icons.password,
                size: 30,
              ),
              lable: 'Password',
            ),
            CustomTextFormField(
              controller: RegisterCubit.get(context).confirmPasswordController,
              padding: 5,
              prefixIcon: Icon(
                Icons.lock,
                size: 30,
              ),
              suffixIcon: Icon(
                Icons.password,
                size: 30,
              ),
              lable: 'Confirm Password',
            ),
            BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if(state is RegisterSuccessState){
                  CustomNavigator.pushAndRemoveUntil(context, HomeLayout());

                }
              },
              child: CustomButton(
                onPressed: () {
                  RegisterCubit.get(context).register();
                },
                text: 'Register',
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
