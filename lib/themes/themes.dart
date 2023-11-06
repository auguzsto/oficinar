import 'package:flutter/material.dart';
import 'package:oficinar/themes/color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
);

class ThemeProvider with ChangeNotifier {
  final ThemeData themeData;
  ThemeProvider(this.themeData) {
    _change();
  }

  void _change() {}
}
