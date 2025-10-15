// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,

    scaffoldBackgroundColor: AppColors.background ,
    
    brightness: Brightness.dark,

    fontFamily: 'CircularStd',

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor : AppColors.secondBackground,

      hintStyle:  const TextStyle(
        color: Color(0xffa7a7a7a7),
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    ),
  );
}