import 'package:flutter/material.dart';

enum ScheduleColor {
  BLUE,
  GREEN,
  PINK,
  BROWN,
  RED,
  CYAN,
  GREY,
}

extension ScheduleColorExtension on ScheduleColor {
  Color get color {
    MaterialColor baseColor;
    switch (this) {
      case ScheduleColor.BLUE:
        baseColor = Colors.blue;
        break;

      case ScheduleColor.GREEN:
        baseColor = Colors.green;
        break;

      case ScheduleColor.PINK:
        baseColor = Colors.pink;
        break;

      case ScheduleColor.BROWN:
        baseColor = Colors.brown;
        break;

      case ScheduleColor.RED:
        baseColor = Colors.red;
        break;

      case ScheduleColor.CYAN:
        baseColor = Colors.cyan;
        break;

      case ScheduleColor.GREY:
        baseColor = Colors.grey;
        break;

      default:
        baseColor = Colors.blue;
        break;
    }

    return baseColor.withOpacity(0.4);
  }
}
