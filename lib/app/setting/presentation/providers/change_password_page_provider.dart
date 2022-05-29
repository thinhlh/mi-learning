import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class ChangePasswordPageProvider extends LoadingProvider {
  final ChangePasswordUseCase _changePasswordUseCase;
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ChangePasswordPageProvider(this._changePasswordUseCase);

  Future<Either<Failure, bool>> changePassword() async {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password.isEmpty) {
      return Left(Failure(message: 'Password must not be empty'));
    } else if (password != confirmPassword) {
      return Left(Failure(message: 'Password confirmation does not match'));
    }

    return _changePasswordUseCase(
      ChangePasswordParams(
        currentPassword: currentPasswordController.text,
        newPassword: passwordController.text,
      ),
    );
  }

  @override
  void dispose() {
    print('disposed');
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
