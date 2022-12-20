import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/checkout_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_use_case_test.mocks.dart';

@GenerateMocks([CourseDetailRepository])
void main() {
  late MockCourseDetailRepository repository;
  late CheckoutUseCase usecase;

  setUp(() {
    repository = MockCourseDetailRepository();
    usecase = CheckoutUseCase(repository);
  });

  const String courseId = 'courseId';

  test('should forward the call to repository', () async {
    // arrange
    when(repository.checkout(courseId))
        .thenAnswer((realInvocation) async => const Right(true));
    // act
    await usecase.call(CheckoutParam(courseId));

    //assert
    verify(repository.checkout(courseId));
    verifyNoMoreInteractions(repository);
  });

  test('should return True when checkout success', () async {
    // arrange
    when(repository.checkout(courseId))
        .thenAnswer((realInvocation) async => const Right(true));
    // act
    final result = await usecase.call(CheckoutParam(courseId));

    //assert
    expect(result.isRight(), true);
    expect(result.foldRight(true, (r, previous) => true), true);
  });

  test('should return Failure when checkout failed', () async {
    // arrange
    when(repository.checkout(courseId))
        .thenAnswer((realInvocation) async => Left(Failure()));
    // act
    final result = await usecase.call(CheckoutParam(courseId));

    //assert
    expect(result.isLeft(), true);
  });
}
