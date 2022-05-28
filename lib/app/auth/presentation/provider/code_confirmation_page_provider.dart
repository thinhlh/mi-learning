import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class CodeConfirmationPageProvider extends LoadingProvider {
  String _code = '';
  set code(String code) {
    _code = code;
  }
}
