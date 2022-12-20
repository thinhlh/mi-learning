import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_use_case.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_page_provider.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_provider_test.mocks.dart';

@GenerateMocks([SignInUseCase, SignUpUseCase])
void main() {
  late MockSignInUseCase signInUseCase;
  late MockSignUpUseCase signUpUseCase;
  late AuthPageProvider provider;

  setUp(() {
    signInUseCase = MockSignInUseCase();
    signUpUseCase = MockSignUpUseCase();
    provider = AuthPageProvider(signInUseCase, signUpUseCase);
  });

  group('Sign In', () {
    final SignInRequestParams params = SignInRequestParams(
      email: 'email',
      password: 'password',
    );
    test('should forward the call to usecase', () async {
      // arrange
      when(signInUseCase(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act
      final result = await provider.signIn(params);
      //assert
      verify(signInUseCase(params)).called(1);
      verifyNoMoreInteractions(signInUseCase);
    });

    test('should return right of true when sign in success', () async {
      // arrange
      when(signInUseCase(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act
      final result = await provider.signIn(params);
      //assert
      expect(result.isRight(), true);
    });

    test('should return left of failure when sign in is failed', () async {
      // arrange
      when(signInUseCase(params))
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await provider.signIn(params);
      //assert
      expect(result.isLeft(), true);
    });
  });
  group('Sign Up', () {
    final SignUpRequestParams params = SignUpRequestParams(
      email: 'email',
      password: 'password',
      name: 'name',
      occupation: 'occupation',
      birthday: DateTime.now(),
      role: 'role',
    );
    test('should forward the call to usecase', () async {
      // arrange
      when(signUpUseCase(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act
      final result = await provider.signUp(params);
      //assert
      verify(signUpUseCase.call(params)).called(1);
      verifyNoMoreInteractions(signUpUseCase);
    });

    test('should return right of true when sign in success', () async {
      // arrange
      when(signUpUseCase(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act
      final result = await provider.signUp(params);
      //assert
      expect(result.isRight(), true);
    });

    test('should return left of failure when sign up is failed', () async {
      // arrange
      when(signUpUseCase(params))
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await provider.signUp(params);
      //assert
      expect(result.isLeft(), true);
    });
  });
}
