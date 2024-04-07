import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required ToastState state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { error, success, warning }

Color getState(ToastState state) {
  switch (state) {
    case ToastState.error:
      return Colors.red;
    case ToastState.success:
      return Colors.green;
    case ToastState.warning:
      return Colors.yellow;
  }
}
