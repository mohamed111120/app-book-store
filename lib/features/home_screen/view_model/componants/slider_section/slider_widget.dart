import 'package:book_store/features/home_screen/model/slider_model/slider_model.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.slider});
  final Sliders slider;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      child: Image.network(slider.image??'',fit: BoxFit.cover,),
    );
  }
}
