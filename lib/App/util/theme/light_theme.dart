import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  primaryColor: const Color(0xFF0D6EFD),
  secondaryHeaderColor: const Color(0xFF000743),
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF0D6EFD))),
  colorScheme: const ColorScheme.light(
          primary: Color(0xFF0D6EFD), secondary: Color(0xFF0D6EFD))
      .copyWith(
    error: const Color(0xFFE84D4F),
  ),
);
