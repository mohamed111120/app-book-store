
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartImage extends StatelessWidget {
  const CartImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return           Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      height: 130.h,
      width: 105.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}