import 'package:flutter/material.dart';

class Varib {
  double myvalue = 0;
  double isemesuyu = 14;
  int boy = 170;
  int kilo = 65;
  late bool kadin;
  static Color renkErkek = Colors.white;
  static Color renkKadin = Colors.white;

  Varib(
      {this.myvalue = 0,
      this.kilo = 65,
      this.boy = 170,
      this.isemesuyu = 14,
      this.kadin = false});

  static void renkDegis(String ke) {
    if (ke == 'kadin') {
      renkKadin = Colors.amberAccent;
      renkErkek = Colors.white;
    } else {
      renkKadin = Colors.white;
      renkErkek = Colors.amberAccent;
    }
  }

  static int hesap(Varib vari) {
    double a = 90 - (vari.boy / vari.kilo);
    a += vari.kadin ? 3 : -3;
    return a.toInt();
  }
}
