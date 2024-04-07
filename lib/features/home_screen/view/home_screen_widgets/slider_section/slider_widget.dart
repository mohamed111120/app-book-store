import 'package:book_store/features/home_screen/model/slider_model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.slider});
  final Sliders slider;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 300,
      child: Image.network(slider.image??'',fit: BoxFit.cover,),
    );
  }
}
