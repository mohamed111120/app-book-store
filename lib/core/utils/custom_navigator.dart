import 'package:flutter/material.dart';

class CustomNavigator {
  static void pushAndRemoveUntil(context , Widget widget) {

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return widget;
    },), (route) => false);
  }
}
