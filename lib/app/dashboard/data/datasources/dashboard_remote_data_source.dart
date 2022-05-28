import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  static const String myCourses = '/courses/me';
  static const String recommendedCourses = '/courses/recommend';
}

abstract class DashboardRemoteDataSource extends BaseApi {
  Future<Either<Failure, List<MyCourse>>> getMyCourses();
  Future<Either<Failure, List<RecommendedCourse>>> getRecommendedCourses();
}

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  @override
  Future<Either<Failure, List<MyCourse>>> getMyCourses() async {
    try {
      final result = await get(_Endpoint.myCourses);

      return Right(
        (result.data as List<dynamic>)
            .map<MyCourse>(
              (rawMyCourse) => MyCourse.fromMap(rawMyCourse),
            )
            .toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<RecommendedCourse>>>
      getRecommendedCourses() async {
    try {
      final result = await get(_Endpoint.recommendedCourses);

      return Right(
        (result.data as List<dynamic>)
            .map<RecommendedCourse>(
              (rawRecommendedCourse) =>
                  RecommendedCourse.fromMap(rawRecommendedCourse),
            )
            .toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
