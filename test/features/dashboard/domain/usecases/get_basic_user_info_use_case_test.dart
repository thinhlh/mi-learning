import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/app/user/domain/repositories/user_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_basic_user_info_use_case_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetBasicUserInfoUseCase usecase;
  late MockUserRepository repository;

  setUp(() {
    repository = MockUserRepository();

    usecase = GetBasicUserInfoUseCase(repository);
  });

  final BasicUserInfo user = BasicUserInfo(
    id: 'id',
    name: 'name',
    email: 'email',
    occupation: 'occupation',
    birthday: DateTime.now(),
    role: 'role',
  );

  test('should forward the call to repository', () async {
    // arrange
    when(repository.getBasicUserInfo())
        .thenAnswer((realInvocation) async => Right(user));
    // act
    await usecase.call(NoParams());
    //assert
    verify(repository.getBasicUserInfo()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return Right of user info when use case return user info',
      () async {
    // arrange
    when(repository.getBasicUserInfo())
        .thenAnswer((realInvocation) async => Right(user));
    // act
    final result = await usecase.call(NoParams());
    //assert
    expect(result.isRight(), true);
    expect(result.foldRight(user, (r, previous) => r), user);
  });

  test('should return Left of failure when use case r', () async {
    // arrange
    when(repository.getBasicUserInfo())
        .thenAnswer((realInvocation) async => Left(Failure()));
    // act
    final result = await usecase.call(NoParams());
    //assert
    expect(result.isLeft(), true);
  });
}
