import 'package:book_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    this.fontSize,
   required this.onPressed,
   this.backgroundColor = AppColor.primary,

  });

  final String text;
  final Color textColor;
  final double? fontSize;
  final void Function()? onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 50),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: onPressed,
          child: CustomText(
            text: text,
            color: textColor,
            fontSize: fontSize,
          )),
    );
  }
}
