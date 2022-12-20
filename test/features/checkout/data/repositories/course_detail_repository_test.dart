import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/course_detail/data/datasources/course_detail_remote_data_source.dart';
import 'package:mi_learning/app/course_detail/data/repositories/course_detail_repository_impl.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'course_detail_repository_test.mocks.dart';

@GenerateMocks([CourseDetailRemoteDataSource])
void main() {
  late MockCourseDetailRemoteDataSource dataSource;
  late CourseDetailRepositoryImpl repository;

  setUp(() {
    dataSource = MockCourseDetailRemoteDataSource();
    repository = CourseDetailRepositoryImpl(dataSource);
  });

  const String courseId = 'courseId';

  test('should forward the call to datasource', () async {
    // arrange
    when(dataSource.checkout(courseId))
        .thenAnswer((realInvocation) async => const Right(true));
    // act
    final result = await repository.checkout(courseId);
    //assert

    verify(dataSource.checkout(courseId)).called(1);
    verifyNoMoreInteractions(dataSource);
  });

  test('should return true when checkout success', () async {
    // arrange
    when(dataSource.checkout(courseId))
        .thenAnswer((realInvocation) async => const Right(true));
    // act
    final result = await repository.checkout(courseId);
    //assert

    expect(result.isRight(), true);
    expect(result.foldRight(true, (r, previous) => true), true);
  });

  test('should return failure when checkout failed', () async {
    // arrange
    when(dataSource.checkout(courseId))
        .thenAnswer((realInvocation) async => Left(Failure()));
    // act
    final result = await repository.checkout(courseId);
    //assert

    expect(result.isLeft(), true);
  });
}
