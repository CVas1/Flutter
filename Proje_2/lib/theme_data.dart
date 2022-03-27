import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.greenAccent),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.redAccent),
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  static late SharedPreferences _sharedPrefObject;

  bool _isGreen = true;
  bool get isGreen => _isGreen;
  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSahrePref(_isGreen);
    notifyListeners();
  }

  Future<void> createShpref() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSahrePref(bool value) {
    _sharedPrefObject.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() async {
    //await createShpref();
    _isGreen = _sharedPrefObject.getBool('themeData') ?? true;

    /*
    if (_sharedPrefObject.getBool('themeData') == null) {
      _isGreen = true;
    } else {
      _isGreen = _sharedPrefObject.getBool('themeData')!;
    };
    */
  }
}
