import 'package:book_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
       this.fontSize, this.onPressed});

  final String text;
  final Color color;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.maxFinite, 50),
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
          onPressed:onPressed,
          child: CustomText(
            text: text,
            color: color,
            fontSize: fontSize,
          )),
    );
  }
}
