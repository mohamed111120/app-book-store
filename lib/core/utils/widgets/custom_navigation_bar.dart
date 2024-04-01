import 'package:book_store/features/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(indicatorColor: Colors.blue.shade100),
      child: NavigationBar(
        height: 60.h,
        backgroundColor: Colors.grey.shade100,
        selectedIndex: 0,
        onDestinationSelected: (value) {},
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
