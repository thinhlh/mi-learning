import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SignUpUseCase signUpUseCase;
  late AuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    signUpUseCase = SignUpUseCase(authRepository);
  });

  final signUpParams = SignUpRequestParams(
    email: 'email',
    password: 'password',
    birthday: DateTime.now(),
    name: 'Tester',
    occupation: 'Tester',
    role: 'Tester',
    avatar: 'Avatar',
  );

  test('should usecase forward the call to repository', () async {
    // arrange
    when(authRepository.signUp(signUpParams))
        .thenAnswer((realInvocation) async => const Right(true));
    // act
    await signUpUseCase(signUpParams);
    //assert

    verify(authRepository.signUp(signUpParams));
    verifyNoMoreInteractions(authRepository);
  });

  test('should get Right true from the repository when sign up success',
      () async {
    // arrange
    when(authRepository.signUp(signUpParams))
        .thenAnswer((_) async => const Right(true));
    // act

    final result = await signUpUseCase(signUpParams);
    //assert
    expect(result, const Right(true));
  });

  test('should get Left when sign up failed from the repository', () async {
    // arrange
    when(authRepository.signUp(signUpParams))
        .thenAnswer((realInvocation) async => Left(Failure(message: 'any')));
    // act
    final result = await signUpUseCase(signUpParams);
    //assert
    expect(result.isLeft(), true);
  });
}
