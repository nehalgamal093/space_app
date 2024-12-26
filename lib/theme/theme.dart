import 'package:flutter/material.dart';

class MyTheme {
  static const redClr = Color(0xffEE403D);
  static const whiteClr = Colors.white;
  static const blackClr =   Color(0xFF0E0E0E);
  static const transparentClr =Colors.transparent;

  static ThemeData myThemeData = ThemeData(
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: whiteClr,
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700),
        titleMedium:  TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: whiteClr,fontFamily: 'SpaceGrotesk'),
        bodyLarge: TextStyle(
            height: 1.2,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: whiteClr,
            fontFamily: 'Inter'),),
  );
}
