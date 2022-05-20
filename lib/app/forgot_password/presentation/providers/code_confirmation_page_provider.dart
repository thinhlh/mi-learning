import 'dart:math';

import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class CodeConfirmationPageProvider extends LoadingProvider {
  String _code = '';
  set code(String code) {
    _code = code;
  }

  Future<int> verifyCode() async {
    // if (_code.isEmpty) {
    //   return 0;
    // }
    // if (_code.length == 4) {
    //   return 2;
    // } else {
    //   return 1;
    // }

    return Random().nextInt(100) % 3;
  }
}
