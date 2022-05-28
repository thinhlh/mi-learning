import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_local_data_souce.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final AuthFirebaseDataSource _authFirebaseDataSource;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._authFirebaseDataSource,
  );

  @override
  Future<Either<Failure, bool>> signIn(SignInRequestParams params) async {
    final firebaseSignInResult =
        await _authFirebaseDataSource.emailPasswordSignIn(
      params.email,
      params.password,
    );

    return firebaseSignInResult.fold(
      (failure) => Left(failure),
      (result) async {
        final loginResult = await _remoteDataSource.signIn(params);

        return loginResult.fold(
          (l) => Left(l),
          (tokens) async => Right(
            await _localDataSource.storeTokens(tokens),
          ),
        );
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> signUp(SignUpRequestParams params) async {
    final firebaseSignUpResult =
        await _authFirebaseDataSource.emailPasswordRegister(
      params.email,
      params.password,
    );

    return firebaseSignUpResult.fold(
      (failure) => Left(failure),
      (result) async {
        final signUpServerResult = await _remoteDataSource.signUp(params);

        return signUpServerResult.fold(
          (l) => Left(l),
          (result) => Right(result),
        );
      },
    );
  }

  @override
  Future<Either<Failure, bool>> emailPasswordFirebaseSignIn(
    SignInRequestParams params,
  ) async {
    final result = await _authFirebaseDataSource.emailPasswordSignIn(
      params.email,
      params.password,
    );

    return result.fold(
      (failure) => Left(failure),
      (emailSignIn) => const Right(true),
    );
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params) {
    return _authFirebaseDataSource.forgetPassword(params.email);
  }
}
