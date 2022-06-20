import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/get_course_type.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  static const String getCourses = '/courses';
}

abstract class DashboardRemoteDataSource extends BaseApi {
  Future<Either<Failure, List<Course>>> getMyCourses();
  Future<Either<Failure, List<Course>>> getRecommendedCourses();
}

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  @override
  Future<Either<Failure, List<Course>>> getMyCourses() async {
    try {
      final result = await get(_Endpoint.getCourses, query: {
        "type": GetCourseType.ME.name,
      });

      return Right(
        (result.data as List<dynamic>)
            .map<Course>(
              (rawCourse) => Course.fromMap(rawCourse),
            )
            .toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getRecommendedCourses() async {
    try {
      final result = await get(
        _Endpoint.getCourses,
        query: {"type": GetCourseType.FOR_YOU.name},
      );

      return Right(
        (result.data as List<dynamic>)
            .map<Course>(
              (rawRecommendedCourse) => Course.fromMap(rawRecommendedCourse),
            )
            .toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
