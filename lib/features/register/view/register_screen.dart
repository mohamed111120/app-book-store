import 'package:book_store/core/utils/custom_navigator.dart';
import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/login/view/login_screen.dart';
import 'package:book_store/features/register/view/regisre_widgets/register_form_section.dart';
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
                const CustomText(
                  text: 'Join Us',
                  color: AppColor.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'already have an account?',
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        CustomNavigator.pushAndRemoveUntil(context, const LoginScreen());
                      },
                      child: const CustomText(
                        text: 'Login',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const RegisterFormSection(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
