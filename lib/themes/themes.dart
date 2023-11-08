import 'package:flutter/material.dart';
import 'package:oficinar/themes/color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  appBarTheme: const AppBarTheme(
    elevation: 1,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
);
