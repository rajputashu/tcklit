import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM, int duration = 2}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.black.withOpacity(0.7),
      // backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
