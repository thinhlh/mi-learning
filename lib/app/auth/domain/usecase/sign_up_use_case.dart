import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/failure.dart';

class SignUpUseCase extends BaseUseCase<SignUpRequestParams, dynamic> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, dynamic>> call(SignUpRequestParams params) async {
    return _repository.signUp(params);
  }
}
