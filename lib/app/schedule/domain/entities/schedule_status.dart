import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';

enum ScheduleStatus {
  PENDING,
  COMPLETED,
  OVERDUE,
}

extension ScheduleStatusExtension on ScheduleStatus {
  Color get color {
    switch (this) {
      case ScheduleStatus.COMPLETED:
        return AppColors.successText;

      case ScheduleStatus.OVERDUE:
        return AppColors.errorText;

      case ScheduleStatus.PENDING:
        return Colors.cyan;
    }
  }
}
