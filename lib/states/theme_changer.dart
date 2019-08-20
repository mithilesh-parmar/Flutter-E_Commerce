import 'package:e_commerce/util/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;
  bool isDark = false;


  ThemeChanger(this._themeData, this.isDark);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setLightTheme() {
    setTheme(Constants.lightTheme);
    isDark = false;
  }

  setDarkTheme() {
    setTheme(Constants.darkTheme);
    isDark = true;
  }
}
