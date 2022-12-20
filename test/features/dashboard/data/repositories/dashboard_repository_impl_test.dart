import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:mi_learning/app/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_repository_impl_test.mocks.dart';

@GenerateMocks([DashboardRemoteDataSource])
void main() {
  late MockDashboardRemoteDataSource dataSource;
  late DashboardRepositoryImpl repository;

  setUp(() {
    dataSource = MockDashboardRemoteDataSource();
    repository = DashboardRepositoryImpl(dataSource);
  });

  final List<Course> courses = [];

  group('Get My Courses', () {
    test('should forward the call to datasource', () async {
      // arrange
      when(dataSource.getMyCourses())
          .thenAnswer((realInvocation) async => Right(courses));
      // act
      await repository.getMyCourses();
      //assert
      verify(dataSource.getMyCourses()).called(1);
      verifyNever(dataSource.getRecommendedCourses());
      verifyNoMoreInteractions(dataSource);
    });

    test('should return Right of courses when datasource success', () async {
      // arrange
      when(dataSource.getMyCourses())
          .thenAnswer((realInvocation) async => Right(courses));
      // act
      final result = await repository.getMyCourses();
      //assert
      expect(result.isRight(), true);
      expect(result.foldRight([], (r, previous) => courses), courses);
    });

    test('should return Failure when fetch courses failed', () async {
      // arrange
      when(dataSource.getMyCourses())
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await repository.getMyCourses();
      //assert
      expect(result.isLeft(), true);
    });
  });

  group('Get Recommended Courses', () {
    test('should forward the call to datasource', () async {
      // arrange
      when(dataSource.getRecommendedCourses())
          .thenAnswer((realInvocation) async => Right(courses));
      // act
      await repository.getRecommendedCourse();
      //assert
      verify(dataSource.getRecommendedCourses()).called(1);
      verifyNever(dataSource.getMyCourses());
      verifyNoMoreInteractions(dataSource);
    });

    test('should return Right of courses when datasource success', () async {
      // arrange
      when(dataSource.getRecommendedCourses())
          .thenAnswer((realInvocation) async => Right(courses));
      // act
      final result = await repository.getRecommendedCourse();
      //assert
      expect(result.isRight(), true);
      expect(result.foldRight([], (r, previous) => courses), courses);
    });

    test('should return Failure when fetch courses failed', () async {
      // arrange
      when(dataSource.getRecommendedCourses())
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await repository.getRecommendedCourse();
      //assert
      expect(result.isLeft(), true);
    });
  });
}
