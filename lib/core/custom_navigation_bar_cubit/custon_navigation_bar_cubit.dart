import 'package:book_store/features/cart/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/books/view/books_screen.dart';
import '../../features/favorites/view/favorites_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/profile/view/profile_screen.dart';

part 'custon_navigation_bar_state.dart';

class CustomNavigationBarCubit extends Cubit<CustomNavigationBarState> {
  CustomNavigationBarCubit() : super(CustomNavigationBarInitial());

  static CustomNavigationBarCubit get(context)=> BlocProvider.of<CustomNavigationBarCubit>(context);

  List<Widget> Screens = [
    const HomeScreen(),
    BooksScreen(),
    FavoritesScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  int currentIndex=0 ;

  void changeScreen(newIndex){
    currentIndex = newIndex;
    emit(ChangeScreenState());
  }



}
