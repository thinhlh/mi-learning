import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/styles.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primarySwatch,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.buttonStyle,
    ),
    buttonTheme: const ButtonThemeData(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.robotoSlab(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.robotoSlab(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3:
          GoogleFonts.robotoSlab(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.robotoSlab(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5:
          GoogleFonts.robotoSlab(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.robotoSlab(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.robotoSlab(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.robotoSlab(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.robotoSlab(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.robotoSlab(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.robotoSlab(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.robotoSlab(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.robotoSlab(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
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
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: GoogleFonts.robotoSlab(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.robotoSlab(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3:
          GoogleFonts.robotoSlab(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.robotoSlab(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5:
          GoogleFonts.robotoSlab(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.robotoSlab(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.robotoSlab(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.robotoSlab(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.robotoSlab(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.robotoSlab(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.robotoSlab(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.robotoSlab(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.robotoSlab(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
  );
}
