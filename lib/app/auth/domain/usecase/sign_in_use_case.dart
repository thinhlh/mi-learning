import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/failure.dart';

class SignInUseCase extends BaseUseCase<SignInRequestParams, bool> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(SignInRequestParams params) {
    return _repository.signIn(params);
  }
}
