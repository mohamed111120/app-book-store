import 'package:book_store/features/home_screen/view/home_screen.dart';
import 'package:book_store/features/profile_screen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custon_navigation_bar_state.dart';

class CustomNavigationBarCubit extends Cubit<CustomNavigationBarState> {
  CustomNavigationBarCubit() : super(CustomNavigationBarInitial());

  static CustomNavigationBarCubit get(context)=> BlocProvider.of<CustomNavigationBarCubit>(context);

  List<Widget> Screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    const ProfileScreen(),
  ];

  int currentIndex=0 ;

  void changeScreen(newIndex){
    currentIndex = newIndex;
    emit(ChangeScreenState());
  }



}
