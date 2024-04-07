import 'package:book_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.validator,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    required this.lable,
    this.obscureText = false,
    this.enabled = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? enabled;

  final double? padding;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String lable;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0.0),
      child: TextFormField(
        enabled: enabled,
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: AppColor.primary,
          suffixIconColor: AppColor.primary,
          label: Text(lable),
          labelStyle: const TextStyle(color: AppColor.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(.5), width: 1.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColor.primary, width: 1),
          ),
        ),
      ),
    );
  }
}
