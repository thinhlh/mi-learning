import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';

enum DialogType {
  success,
  error,
  info,
}

extension DialogDetail on DialogType {
  String get title {
    switch (this) {
      case DialogType.success:
        return tr(LocaleKeys.common_dialog_success_title);
      case DialogType.error:
        return tr(LocaleKeys.common_dialog_error_title);
      case DialogType.info:
        return tr(LocaleKeys.common_dialog_info_title);
    }
  }

  String get actionString {
    switch (this) {
      case DialogType.success:
        return tr(LocaleKeys.common_dialog_success_action);
      case DialogType.error:
        return tr(LocaleKeys.common_dialog_error_action);
      case DialogType.info:
        return tr(LocaleKeys.common_dialog_info_action);
    }
  }

  Color get primaryColor {
    switch (this) {
      case DialogType.success:
        return AppColors.success;
      case DialogType.error:
        return AppColors.error;
      case DialogType.info:
        return AppColors.info;
    }
  }

  Color get primaryColorText {
    switch (this) {
      case DialogType.success:
        return AppColors.successText;
      case DialogType.error:
        return AppColors.errorText;
      case DialogType.info:
        return AppColors.infoText;
    }
  }

  IconData get displayIcon {
    switch (this) {
      case DialogType.success:
        return Icons.check;
      case DialogType.error:
        return Icons.priority_high;
      case DialogType.info:
        return Icons.question_mark;
    }
  }

  Color get iconColor {
    switch (this) {
      case DialogType.success:
        return AppColors.neutral.shade50;
      case DialogType.error:
        return AppColors.neutral.shade50;
      case DialogType.info:
        return AppColors.neutral.shade800;
    }
  }
}
