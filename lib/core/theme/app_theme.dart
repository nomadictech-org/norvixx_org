import 'package:flutter/material.dart';

class NorvixTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0B1020),
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF9CA3AF)),
    ),
  );
}
