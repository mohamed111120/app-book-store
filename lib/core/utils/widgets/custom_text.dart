import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.fontWeight = FontWeight.normal,
      this.color, this.textAlign, this.textDecoration, this.maxLines})
      : super(key: key);
  final String text;

  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;


  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      textAlign: textAlign,
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration
      ),
    );
  }
}
