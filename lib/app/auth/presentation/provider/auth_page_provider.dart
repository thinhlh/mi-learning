import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_use_case.dart';
import 'package:mi_learning/app/common/domain/entity/tokens.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class AuthPageProvider extends LoadingProvider {
  // Usecases
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthPageProvider(this._signInUseCase, this._signUpUseCase);

  //  values
  bool _isLogin = true;
  String? _role;

  // controllers
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController reEnterPasswordController =
  //     TextEditingController();
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController occupationController = TextEditingController();

  // getters & setters
  bool get isLogin => _isLogin;

  bool _success = false;
  bool get success => _success;
  set success(bool value) {
    _success = value;
    notifyListeners();
  }

  String? get role => _role;
  set role(String? value) {
    _role = value;
    notifyListeners();
  }

  // Methods

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

  Future<Either<Failure, bool>> signIn(SignInRequestParams params) {
    return _signInUseCase.call(params);
  }

  Future<Either<Failure, dynamic>> signUp(SignUpRequestParams params) {
    return _signUpUseCase(params);
  }
}
