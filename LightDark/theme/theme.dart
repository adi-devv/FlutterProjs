import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.blueGrey.shade700,
    primary: Colors.blueGrey,
    secondary: Colors.blueGrey.shade300,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.deepPurple.shade900,
    primary: Colors.deepPurple,
    secondary: Colors.deepPurple.shade300,
  ),
);