import 'package:book_store/core/custom_navigation_bar_cubit/custon_navigation_bar_cubit.dart';
import 'package:book_store/core/utils/widgets/custom_app_bar.dart';
import 'package:book_store/core/utils/widgets/custom_drawer.dart';
import 'package:book_store/core/custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomNavigationBarCubit, CustomNavigationBarState>(
      builder: (context, state) {
        var cubit = CustomNavigationBarCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(),
          body: cubit
              .Screens[cubit.currentIndex],
          drawer: const CustomDrawer(),
          bottomNavigationBar: const CustomNavigationBar(),
        );
      },
    );
  }
}
