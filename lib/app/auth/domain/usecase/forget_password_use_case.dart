import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class ForgetPasswordParams implements Params {
  // final String verificationCode;
  final String email;

  ForgetPasswordParams(
    // this.verificationCode,
    this.email,
  );
}

class ForgetPasswordUseCase extends BaseUseCase<ForgetPasswordParams, bool> {
  final AuthRepository _authRepository;

  ForgetPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(ForgetPasswordParams params) async {
    return _authRepository.forgetPassword(params);
  }
}
