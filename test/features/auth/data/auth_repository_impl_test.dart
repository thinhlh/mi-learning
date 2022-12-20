import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_local_data_souce.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mi_learning/app/auth/data/repository/auth_repository_impl.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/common/domain/entity/tokens.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks(
    [AuthRemoteDataSource, AuthLocalDataSource, AuthFirebaseDataSource])
void main() {
  late MockAuthLocalDataSource localDataSource;
  late MockAuthRemoteDataSource remoteDataSource;
  late MockAuthFirebaseDataSource authFirebaseDataSource;

  late AuthRepositoryImpl authRepository;

  setUp(() {
    localDataSource = MockAuthLocalDataSource();
    remoteDataSource = MockAuthRemoteDataSource();
    authFirebaseDataSource = MockAuthFirebaseDataSource();

    authRepository = AuthRepositoryImpl(
      remoteDataSource,
      localDataSource,
      authFirebaseDataSource,
    );
  });

  group('Sign In', () {
    final Tokens tokens = Tokens(
      tokenType: 'bearer',
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
    );
    final SignInRequestParams params = SignInRequestParams(
      email: 'email@gmail.com',
      password: 'Password',
    );

    test('should forward the call to datasource if email and password valid',
        () async {
      // arrange
      when(remoteDataSource.signIn(params))
          .thenAnswer((realInvocation) async => Right(tokens));
      when(localDataSource.storeTokens(tokens))
          .thenAnswer((realInvocation) async => true);
      // act
      await authRepository.signIn(params);
      //assert
      verifyInOrder([
        remoteDataSource.signIn(params),
        localDataSource.storeTokens(tokens),
      ]);
      verifyNoMoreInteractions(remoteDataSource);
      verifyNoMoreInteractions(localDataSource);
    });

    test('should not forward the call to datasource if email is invalid',
        () async {
      // arrange
      final wrongParams = params.copyWith(email: 'wrongemail');
      // act
      await authRepository.signIn(wrongParams);

      //assert
      verifyZeroInteractions(remoteDataSource);
      verifyZeroInteractions(localDataSource);
    });

    test('should not forward the call to datasource if password is invalid',
        () async {
      // arrange
      final wrongParams = params.copyWith(password: '');
      // act
      await authRepository.signIn(wrongParams);

      //assert
      verifyZeroInteractions(remoteDataSource);
      verifyZeroInteractions(localDataSource);
    });

    test(
        'should return failure to repository when email or password is invalid',
        () async {
      // arrange
      final wrongParams = params.copyWith(
        email: 'email',
        password: '',
      );
      // act
      final result = await authRepository.signIn(wrongParams);
      //assert
      expect(result.isLeft(), true);
    });

    test('should return and save token when credential is correct', () async {
      // arrange
      when(remoteDataSource.signIn(params))
          .thenAnswer((realInvocation) async => Right(tokens));
      when(localDataSource.storeTokens(tokens))
          .thenAnswer((realInvocation) async => true);
      // act
      final result = await authRepository.signIn(params);
      //assert

      verifyInOrder([
        remoteDataSource.signIn(params),
        localDataSource.storeTokens(tokens),
      ]);
      verifyNoMoreInteractions(remoteDataSource);
      verifyNoMoreInteractions(localDataSource);

      expect(result.isRight(), true);
    });

    test('should return failure when credential is incorrect', () async {
      // arrange
      when(remoteDataSource.signIn(params))
          .thenAnswer((realInvocation) async => Left(Failure()));
      when(localDataSource.storeTokens(tokens))
          .thenAnswer((realInvocation) async => true);
      // act
      final result = await authRepository.signIn(params);
      //assert
      verify(remoteDataSource.signIn(params)).called(1);
      verifyZeroInteractions(localDataSource);
      expect(result.isLeft(), true);
    });
  });

  group('Sign Up', () {
    final SignUpRequestParams params = SignUpRequestParams(
      email: 'email@gmail.com',
      password: 'password',
      name: 'name',
      occupation: 'occupation',
      birthday: DateTime.now(),
      role: 'role',
    );

    test('should forward the call to datasource if params is valid', () async {
      // arrange
      when(remoteDataSource.signUp(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act
      await authRepository.signUp(params);
      //assert

      verify(remoteDataSource.signUp(params));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should not forward the call to datasource if email is invalid',
        () async {
      // arrange
      final wrongParams = params.copyWith(email: 'wrongemail');
      // act
      await authRepository.signUp(wrongParams);

      //assert
      verifyZeroInteractions(remoteDataSource);
    });

    test('should not forward the call to datasource if password is invalid',
        () async {
      // arrange
      final wrongParams = params.copyWith(password: '');
      // act
      await authRepository.signUp(wrongParams);

      //assert
      verifyZeroInteractions(remoteDataSource);
    });

    test(
        'should return failure to repository when email or password is invalid',
        () async {
      // arrange
      final wrongParams = params.copyWith(
        email: 'email',
        password: '',
      );
      // act
      final result = await authRepository.signUp(wrongParams);
      //assert
      expect(result.isLeft(), true);
    });

    test('should return true sign up success', () async {
      // arrange
      when(remoteDataSource.signUp(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act
      final result = await authRepository.signUp(params);
      //assert

      verify(remoteDataSource.signUp(params)).called(1);
      expect(result.isRight(), true);
    });

    test('should return failure when register is failed', () async {
      // arrange
      when(remoteDataSource.signUp(params))
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await authRepository.signUp(params);
      //assert
      verify(remoteDataSource.signUp(params)).called(1);
      expect(result.isLeft(), true);
    });
  });

  group('Forget Password', () {
    final ForgetPasswordParams params = ForgetPasswordParams('email');
  });

  //   Future<Either<Failure, bool>> emailPasswordFirebaseSignIn(
  //   SignInRequestParams params,
  // );
  // Future<Either<Failure, bool>> signIn(SignInRequestParams params);
  // Future<Either<Failure, dynamic>> signUp(SignUpRequestParams params);
  // Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParams params);
}
