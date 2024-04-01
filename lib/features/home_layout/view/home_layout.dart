import 'package:book_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:book_store/core/utils/widgets/custom_app_bar.dart';
import 'package:book_store/core/utils/widgets/custom_drawer.dart';
import 'package:book_store/core/utils/widgets/custom_navigation_bar.dart';
import 'package:book_store/features/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(),
      body: HomeScreen(),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
