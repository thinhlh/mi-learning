import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/base/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> emailPasswordFirebaseSignIn(
    SignInRequestParams params,
  );
  Future<Either<Failure, bool>> signIn(SignInRequestParams params);
  Future<Either<Failure, dynamic>> signUp(SignUpRequestParams params);
  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params);
}
