import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  static const String courseDetail = "/course";
  static const String toggleSaveCourse = '/course/save';
  static const String savedCourses = '/courses/saved';
  static const String purchase = "/purchase";
}

abstract class CourseDetailRemoteDataSource extends BaseApi {
  Future<Either<Failure, Course>> getCourseDetail(String courseId);
  Future<Either<Failure, bool>> toggleSaveCourse(
    ToggleSaveCourseParams params,
  );
  Future<Either<Failure, List<Course>>> getSavedCourses();
  Future<Either<Failure, bool>> checkout(String courseId);
}

class CourseDetailRemoteDataSourceImpl extends CourseDetailRemoteDataSource {
  @override
  Future<Either<Failure, Course>> getCourseDetail(String courseId) async {
    try {
      final result = await get(_Endpoint.courseDetail, query: {
        "courseId": courseId,
      });

      return Right(Course.fromMap(result.data));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleSaveCourse(
      ToggleSaveCourseParams params) async {
    try {
      final result = await post(
        _Endpoint.toggleSaveCourse,
        data: params.toMap(),
      );

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getSavedCourses() async {
    try {
      final result = await get(_Endpoint.savedCourses);

      return Right((result.data as List<dynamic>)
          .map((r) => Course.fromMap(r))
          .toList());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkout(String courseId) async {
    try {
      final result = await post(_Endpoint.purchase, query: {
        "courseId": courseId,
      });

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
