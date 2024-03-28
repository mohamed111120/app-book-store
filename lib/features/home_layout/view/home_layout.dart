import 'package:book_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:book_store/features/home_layout/view_model/componants/home_layout_drawer/home_layout_drawer.dart';
import 'package:book_store/features/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: HomeLayoutDrawer(),
      body: HomeScreen()
    );
  }
}
