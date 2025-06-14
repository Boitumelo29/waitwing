import 'package:flutter/material.dart';

class ColourScheme {
  static ColorScheme lightScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.purple,
      onPrimary: Colors.white,
      secondary: Colors.purple.shade100,
      onSecondary: Colors.purple.shade300,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.red.shade400);

  static ColorScheme darkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.purple.shade900,
      onPrimary: Colors.white,
      secondary: Colors.purple.shade800,
      onSecondary: Colors.purple.shade700,
      surface: Colors.grey,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.red.shade400);
}
