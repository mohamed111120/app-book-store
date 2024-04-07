import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/home_layout/view/home_layout.dart';
import 'package:book_store/features/register/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/custom_navigator.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.primary, width: 2)),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            key: RegisterCubit.get(context).formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: RegisterCubit.get(context).nameController,
                  padding: 5,
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                  lable: 'Name',
                ),
                CustomTextFormField(
                  controller: RegisterCubit.get(context).emailController,
                  padding: 5,
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 30,
                  ),
                  lable: 'Email',
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return 'Please enter valid email';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextFormField(
                  controller: RegisterCubit.get(context).passwordController,
                  padding: 5,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      RegisterCubit.get(context).changePasswordIcon();
                    },
                    icon: RegisterCubit.get(context).passwordIcon
                        ? const FaIcon(
                            FontAwesomeIcons.eye,
                            size: 20,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.eyeSlash,
                            size: 20,
                          ),
                  ),
                  lable: 'Password',
                  obscureText:
                      RegisterCubit.get(context).passwordIcon ? false : true,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return 'Enter your password';
                    } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
                      return 'Password should has at least one uppercase letter';
                    } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]')
                        .hasMatch(value)) {
                      return 'Password should has special character';
                    } else if (!RegExp(r'[1-9]').hasMatch(value)) {
                      return 'password should has one number at least';
                    } else if ((value.length ?? 0) < 8) {
                      return 'Password can\'t be less than 8 Characters';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller:
                      RegisterCubit.get(context).confirmPasswordController,
                  padding: 5,
                  validator: (v) {
                    if (RegisterCubit.get(context)
                            .confirmPasswordController
                            .text !=
                        RegisterCubit.get(context).passwordController.text) {
                      return 'confirmPassword dont match with password';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  obscureText: RegisterCubit.get(context).confirmPasswordIcon
                      ? false
                      : true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      RegisterCubit.get(context).changeConfirmPasswordIcon();
                    },
                    icon: RegisterCubit.get(context).confirmPasswordIcon
                        ? const FaIcon(
                            FontAwesomeIcons.eye,
                            size: 20,
                          )
                        : const FaIcon(
                            FontAwesomeIcons.eyeSlash,
                            size: 20,
                          ),
                  ),
                  lable: 'Confirm Password',
                ),
                BlocListener<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccessState) {
                      CustomNavigator.pushAndRemoveUntil(context, const HomeLayout());
                    }
                  },
                  child: CustomButton(
                    onPressed: () {
                      if (RegisterCubit.get(context)
                          .formKey!
                          .currentState!
                          .validate()) {
                        RegisterCubit.get(context).register();
                      }
                    },
                    text: 'Register',
                    textColor: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
