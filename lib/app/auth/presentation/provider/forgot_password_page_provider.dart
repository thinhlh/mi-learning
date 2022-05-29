import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class ForgotPasswordPageProvider extends LoadingProvider {
  Timer? countDownTimer;

  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgotPasswordPageProvider(this._forgetPasswordUseCase);

  Future<Either<Failure, bool>> sendPasswordReset(String email) async {
    // showLoading(true);
    startTimer();
    final result = await _forgetPasswordUseCase(ForgetPasswordParams(email));
    await Future.delayed(Duration(seconds: 3));
    stopTimer();

    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }

  void startTimer() {
    countDownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        notifyListeners();
      },
    );
  }

  void stopTimer() {
    countDownTimer?.cancel();
    countDownTimer = null;
    notifyListeners();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}
