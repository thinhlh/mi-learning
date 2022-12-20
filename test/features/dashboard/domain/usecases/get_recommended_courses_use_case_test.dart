import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/domain/repository/dashboard_repository.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recommended_courses_use_case_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late GetRecommendedCourseUseCase usecase;
  late MockDashboardRepository repository;

  setUp(() {
    repository = MockDashboardRepository();
    usecase = GetRecommendedCourseUseCase(repository);
  });

  final List<Course> courses = [];

  test('should forward the call to repository', () async {
    // arrange
    when(repository.getRecommendedCourse())
        .thenAnswer((realInvocation) async => Right(courses));
    // act

    await usecase.call(NoParams());
    //assert

    verify(repository.getRecommendedCourse()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test(
      'should return Right of recommended courses when use case return courses',
      () async {
    // arrange
    when(repository.getRecommendedCourse())
        .thenAnswer((realInvocation) async => Right(courses));
    // act

    final result = await usecase.call(NoParams());
    //assert

    expect(result.isRight(), true);
    expect(result.foldRight([], (r, previous) => courses), courses);
  });

  test('should return Left of failure when use case r', () async {
    // arrange
    when(repository.getRecommendedCourse())
        .thenAnswer((realInvocation) async => Left(Failure()));
    // act
    final result = await usecase.call(NoParams());
    //assert
    expect(result.isLeft(), true);
  });
}
