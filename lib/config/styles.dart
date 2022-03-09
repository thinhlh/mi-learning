import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class AppStyles {
  AppStyles._internal();

  /// TODO define all widgets style of the application here

  static final TextStyle titleLarge = TextStyle(
    fontSize: Dimens.largeText,
    color: AppColors.neutral_900,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle titleMedium = TextStyle(
    fontSize: Dimens.mediumText,
    color: AppColors.neutral_900,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle titleSmall = TextStyle(
    fontSize: Dimens.mediumText,
    color: AppColors.neutral_900,
    fontWeight: FontWeight.w500,
  );
}
