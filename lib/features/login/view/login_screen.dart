import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/features/login/view/login_screen.dart';
import 'package:book_store/features/login/view_model/components/Login_form_section.dart';
import 'package:book_store/features/register/view/register_screen.dart';
import 'package:book_store/features/register/view_model/components/register_form_section.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/widgets/custom_text.dart';

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
                CustomText(
                  text: 'Login',
                  color: AppColor.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'you dont\'? have an account',
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RegisterScreen();
                          },
                        ));
                      },
                      child: CustomText(
                        text: 'register',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LoginFormSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
