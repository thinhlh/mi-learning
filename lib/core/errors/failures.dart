import 'package:easy_localization/easy_localization.dart';
import 'package:mi_learning/base/failure.dart';

/// Each failure has the accompanied with a specific exception
class InitializationFailure extends Failure {
  InitializationFailure() : super(message: tr('message'));
}

class APIFailure extends Failure {}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({String? message})
      : super(message: message ?? tr('message'));
}

class FieldFailure extends Failure {
  FieldFailure(String message) : super(message: message);
}
