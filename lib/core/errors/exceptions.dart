import 'package:easy_localization/easy_localization.dart';
import 'package:mi_learning/base/exception.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';

/// Each exception has the accompanied with a specific failure
class InitalizationException implements BaseException {
  final String message = tr(LocaleKeys.common_default_error);
}

class AuthenticationException implements BaseException {
  final String message = tr(LocaleKeys.common_default_error);
}
