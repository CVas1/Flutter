import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(String? text, Color color) {
    if (text == null) return;
    final snackBar = SnackBar(
      duration: Duration(seconds: 4),
      content: Text(text),
      backgroundColor: color,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
