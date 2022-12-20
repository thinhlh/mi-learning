import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_use_case.dart';
import 'package:mi_learning/app/common/domain/entity/tokens.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SignInUseCase signInUseCase;
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    signInUseCase = SignInUseCase(authRepository);
  });

  final signInParams = SignInRequestParams(
    email: 'email',
    password: 'password',
  );

  test('should usecase forward the call to repository', () async {
    // arrange
    when(authRepository.signIn(signInParams))
        .thenAnswer((realInvocation) async => const Right(true));
    // act
    signInUseCase(signInParams);
    //assert

    verify(authRepository.signIn(signInParams));
    verifyNoMoreInteractions(authRepository);
  });

  test('should get Right true from the repository when sign in success',
      () async {
    // arrange
    when(authRepository.signIn(any)).thenAnswer((_) async => const Right(true));
    // act

    final result = await signInUseCase(signInParams);
    //assert
    expect(result, const Right(true));
  });

  test('should get Left of Authentication failure from the repository',
      () async {
    // arrange
    when(authRepository.signIn(signInParams))
        .thenAnswer((realInvocation) async => Left(Failure(message: 'any')));
    // act
    final result = await signInUseCase(signInParams);
    //assert
    expect(result.isLeft(), true);
  });
}
