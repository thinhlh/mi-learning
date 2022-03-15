import 'package:flutter/material.dart';

class AppColors {
  AppColors._internal(); // this basically makes it so you can instantiate this class

  /// App Colors
  static const Color primary = Color(0xFF7552A0);
  static const Color primaryLight = Color(0xFF82b2bc);
  static const Color primaryDark = Color(0xFF25555f);

  static const Color secondary = Color(0xFFff9800);
  static const Color secondaryLight = Color(0xFFc66900);
  static const Color secondaryDark = Color(0xFFffc947);

  static const Color tetiary = Color(0xFFB8E3DA);

  /// Background colors
  /// Neutral_50
  static const Color backgroundLight = neutral_50;
  static const Color backgroundNeutral = neutral_200;
  static const Color backgroundDark = neutral_800;

  /// Follow design

  static const Color neutral_50 = Color(0xFFFAFAFA);
  static const Color neutral_100 = Color(0xFFF5F5F5);
  static const Color neutral_200 = Color(0xFFEEEEEE);
  static const Color neutral_300 = Color(0xFFE0E0E0);
  static const Color neutral_400 = Color(0xFF9E9E9E);
  static const Color neutral_500 = Color(0xFF9E9E9E);
  static const Color neutral_600 = Color(0xFF757575);
  static const Color neutral_700 = Color(0xFF616161);
  static const Color neutral_800 = Color(0xFF424242);
  static const Color neutral_900 = Color(0xFF212121);

  /// Text colors
  static const Color textPrimary = neutral_900;
  static const Color textSecondary = neutral_400;
  static const Color textDisable = neutral_600;
  static const Color textPrimaryLight = neutral_50;
}
