import 'package:book_store/features/home_screen/view_model/componants/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_cubits/slider_cubit/slider_cubit.dart';

class SlidrsSection extends StatelessWidget {
  const SlidrsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SliderCubit, SliderState>(
  builder: (context, state) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SliderWidget(
            slider: SliderCubit.get(context).sliders[index],
          );
        },
        itemCount:SliderCubit.get(context).sliders.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 20,);
        },
      ),
    );
  },
);
  }
}
