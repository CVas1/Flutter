import 'package:flutter/material.dart';

class Kutu extends StatelessWidget {
  final Color renk;
  final Widget child;
  final void Function()? onPress;

  Kutu({this.renk = Colors.white, required this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
      ),
    );
  }
}
