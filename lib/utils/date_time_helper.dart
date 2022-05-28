import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class DateTimeHelper {
  /// Format HH:mm:ss
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String formatDurationNoHout(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static DateTime dateTimeFromServerDateTimeResponse(List<int> source) {
    return DateTime.utc(
      source[0],
      source[1],
      source[2],
      source.length >= 4 ? source[3] : 0,
      source.length >= 5 ? source[4] : 0,
      source.length >= 6 ? source[5] : 0,
    );
  }

  static TimeOfDay timeFromServerTimeResponse(List<int> source) {
    return TimeOfDay(
      hour: source[0],
      minute: source[1],
    );
  }

  static String format(DateTime source, {DateFormat? format}) {
    try {
      format = format ?? DateFormat('yyyy-MM-dd');
      return format.format(source);
    } catch (e) {
      return DateFormat.yMd().format(source);
    }
  }
}
