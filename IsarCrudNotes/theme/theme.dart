import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.lightBlue,
    primary: Colors.lightBlue.shade100,
    secondary: Colors.lightBlue.shade700,
    inversePrimary: Colors.lightBlue.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.dark(
    surface: Colors.lightBlueAccent,
    primary: Colors.lightBlueAccent.shade100,
    secondary: Colors.blueGrey,
    inversePrimary: Colors.blueGrey.shade700,
  ),
);
