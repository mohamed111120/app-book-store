import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/register/view/register_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/custom_navigator.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/widgets/custom_text.dart';
import 'login_widgets/Login_form_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.loginImage,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const CustomText(
                  text: 'Login',
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
                      text: 'you dont\'? have an account',
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        CustomNavigator.pushAndRemoveUntil(context, const RegisterScreen());

                      },
                      child: const CustomText(
                        text: 'register',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const LoginFormSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
