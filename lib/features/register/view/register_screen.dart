import 'package:book_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:book_store/core/utils/Navigator.dart';
import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/home_screen/view/home_screen.dart';
import 'package:book_store/features/login/view/login_screen.dart';
import 'package:book_store/features/register/view_model/components/register_form_section.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/widgets/custom_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset(
                  AppImages.RegisterImage,
                  width: 200,
                  height: 200,
                ),
                CustomText(
                  text: 'Join Us',
                  color: AppColor.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'already have an account?',
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        CustomNavigator.pushAndRemoveUntil(context, LoginScreen());
                      },
                      child: CustomText(
                        text: 'Login',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                RegisterFormSection(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
