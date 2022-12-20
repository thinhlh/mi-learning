import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_my_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_page_provider.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_provider_test.mocks.dart';

@GenerateMocks(
    [GetMyCoursesUseCase, GetRecommendedCourseUseCase, GetBasicUserInfoUseCase])
void main() {
  late MockGetMyCoursesUseCase getMyCoursesUseCase;
  late MockGetRecommendedCourseUseCase getRecommendedCourseUseCase;
  late MockGetBasicUserInfoUseCase getBasicUserInfoUseCase;
  late DashboardPageProvider provider;

  setUp(() {
    getMyCoursesUseCase = MockGetMyCoursesUseCase();
    getRecommendedCourseUseCase = MockGetRecommendedCourseUseCase();
    getBasicUserInfoUseCase = MockGetBasicUserInfoUseCase();
    provider = DashboardPageProvider(
      getMyCoursesUseCase,
      getRecommendedCourseUseCase,
      getBasicUserInfoUseCase,
    );
  });

  group('Get User Basic Info', () {
    final BasicUserInfo user = BasicUserInfo(
      id: 'id',
      name: 'name',
      email: 'email',
      occupation: 'occupation',
      birthday: DateTime.now(),
      role: 'role',
    );

    test('should forward the call to usecase', () async {
      // arrange
      when(getBasicUserInfoUseCase.call(NoParams()))
          .thenAnswer((realInvocation) async => Right(user));
      // act
      await provider.getBasicUserInfo();
      //assert
      verify(getBasicUserInfoUseCase.call(NoParams())).called(1);
      verifyNever(getRecommendedCourseUseCase.call(NoParams()));
      verifyNever(getMyCoursesUseCase.call(NoParams()));
      verifyNoMoreInteractions(getBasicUserInfoUseCase);
    });

    test('should return Right of courses when use case return courses',
        () async {
      // arrange
      when(getBasicUserInfoUseCase.call(NoParams()))
          .thenAnswer((realInvocation) async => Right(user));
      // act
      final result = await provider.getBasicUserInfo();
      //assert
      expect(result.isRight(), true);
      expect(result.foldRight(user, (r, previous) => user), user);
    });

    test('should return Left of Failure when usecase return Failure', () async {
      // arrange
      when(getBasicUserInfoUseCase.call(NoParams()))
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await provider.getBasicUserInfo();
      //assert
      expect(result.isLeft(), true);
    });
  });
  group('Get Courses', () {
    final List<Course> courses = [];
    group('Get My Courses', () {
      test('should forward the call to usecase', () async {
        // arrange
        when(getMyCoursesUseCase.call(NoParams()))
            .thenAnswer((realInvocation) async => Right(courses));
        // act
        await provider.getMyCourses();
        //assert
        verify(getMyCoursesUseCase.call(NoParams())).called(1);
        verifyNever(getRecommendedCourseUseCase.call(NoParams()));
        verifyNever(getBasicUserInfoUseCase.call(NoParams()));
        verifyNoMoreInteractions(getMyCoursesUseCase);
      });

      test('should return Right of courses when use case return courses',
          () async {
        // arrange
        when(getMyCoursesUseCase.call(NoParams()))
            .thenAnswer((realInvocation) async => Right(courses));
        // act
        final result = await provider.getMyCourses();
        //assert
        expect(result.isRight(), true);
        expect(result.foldRight([], (r, previous) => courses), courses);
      });

      test('should return Left of Failure when usecase return Failure',
          () async {
        // arrange
        when(getMyCoursesUseCase.call(NoParams()))
            .thenAnswer((realInvocation) async => Left(Failure()));
        // act
        final result = await provider.getMyCourses();
        //assert
        expect(result.isLeft(), true);
      });
    });
    group('Get Recommended Courses', () {
      test('should forward the call to usecase', () async {
        // arrange
        when(getMyCoursesUseCase.call(NoParams()))
            .thenAnswer((realInvocation) async => Right(courses));
        // act
        await provider.getMyCourses();
        //assert
        verify(getMyCoursesUseCase.call(NoParams())).called(1);
        verifyNever(getRecommendedCourseUseCase.call(NoParams()));
        verifyNever(getBasicUserInfoUseCase.call(NoParams()));
        verifyNoMoreInteractions(getMyCoursesUseCase);
      });

      test('should return Right of courses when use case return courses',
          () async {
        // arrange
        when(getRecommendedCourseUseCase.call(NoParams()))
            .thenAnswer((realInvocation) async => Right(courses));
        // act
        final result = await provider.getRecommendedCourses();
        //assert
        expect(result.isRight(), true);
        expect(result.foldRight([], (r, previous) => courses), courses);
      });

      test('should return Left of Failure when usecase return Failure',
          () async {
        // arrange
        when(getRecommendedCourseUseCase.call(NoParams()))
            .thenAnswer((realInvocation) async => Left(Failure()));
        // act
        final result = await provider.getRecommendedCourses();
        //assert
        expect(result.isLeft(), true);
      });
    });
  });
}
