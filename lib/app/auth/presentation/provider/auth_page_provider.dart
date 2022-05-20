import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class AuthPageProvider extends LoadingProvider {
  //  values
  bool _isLogin = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _success = false;
  bool get success => _success;
  set success(bool value) {
    _success = value;
    notifyListeners();
  }

  // Public getter & setter
  bool get isLogin => _isLogin;

  void goToSignUp() {
    if (_isLogin) {
      _isLogin = false;
      notifyListeners();
    }
  }

  void goToSignIn() {
    if (!_isLogin) {
      _isLogin = true;
      notifyListeners();
    }
  }

  void signIn() {
    showLoading(true);
    Future.delayed(const Duration(seconds: 3)).then((_) {
      showLoading(false);
      success = true;
    });
  }
}
