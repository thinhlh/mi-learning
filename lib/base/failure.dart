import 'package:easy_localization/easy_localization.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';

class Failure {
  String message = tr(LocaleKeys.common_default_error);

  Failure({String? message}) {
    this.message = message ?? this.message;
  }
}
