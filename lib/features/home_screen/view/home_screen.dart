import 'package:book_store/features/home_screen/view_model/componants/best_seller_section/best_seller_section.dart';
import 'package:book_store/features/home_screen/view_model/componants/categories_section/categories_section.dart';
import 'package:book_store/features/home_screen/view_model/componants/new_arrivals_section/new_arrivals_section.dart';
import 'package:book_store/features/home_screen/view_model/componants/slider_section/slider_widget.dart';
import 'package:book_store/features/home_screen/view_model/home_cubits/slider_cubit/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/componants/slider_section/sliders_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    SliderCubit.get(context).getSliderImages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: const [
        SlidersSection(),
        BestSellerSection(),
        CategoriesSection(),
        NewArrivalsSection(),
      ],
    );
  }
}
