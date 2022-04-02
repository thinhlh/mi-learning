import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/styles.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primarySwatch,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.buttonStyle,
    ),
    textTheme: Typography.blackCupertino,
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.neutral.shade900,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackground,
      elevation: 0,
    ),
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    textTheme: Typography.whiteCupertino,
  );
}
