import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class AuthProvider extends LoadingProvider {
  //  values
  bool _isLogin = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
  }
}
