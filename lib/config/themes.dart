import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.buttonStyle,
    ),
    textTheme: Typography.blackCupertino,
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.neutral_900,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBackground,
      elevation: 0,
    ),
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
