import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.buttonBorderRadius,
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
    textTheme: Typography.blackCupertino,
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.neutral_900,
    ),
    scaffoldBackgroundColor: AppColors.backgroundNeutral,
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
