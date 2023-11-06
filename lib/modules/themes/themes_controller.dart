import 'package:flutter/material.dart';
import 'package:oficinar/themes/themes.dart';

class ThemesController with ChangeNotifier {
  late ThemeData currentTheme = lightTheme;
  void update() {
    if (currentTheme != lightTheme) {
      currentTheme = lightTheme;
      notifyListeners();
    } else {
      currentTheme = darkTheme;
      notifyListeners();
    }
  }
}
