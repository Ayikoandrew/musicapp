import 'package:client/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppPalette {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: color,
      ),
      borderRadius: BorderRadius.circular(10.0));

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27.0),
      enabledBorder: _border(Pallete.borderColor),
      focusedBorder: _border(Pallete.gradient2),
    ),
  );
}
