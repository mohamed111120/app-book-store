import 'package:flutter/material.dart';

import 'home_screen_widgets/best_seller_section/best_seller_section.dart';
import 'home_screen_widgets/categories_section/categories_section.dart';
import 'home_screen_widgets/new_arrivals_section/new_arrivals_section.dart';
import 'home_screen_widgets/slider_section/sliders_section.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
