import 'package:dartz/dartz.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class CodeConfirmationProvider extends LoadingProvider {
  String _code = '';
  set code(String code) {
    _code = code;
  }

  Future<Tuple2<bool, String?>> verifyCode() async {
    if (_code.length == 4) {
      return const Tuple2(true, null);
    } else {
      return const Tuple2(false, 'Verification code must have 4 characters');
    }
  }
}
