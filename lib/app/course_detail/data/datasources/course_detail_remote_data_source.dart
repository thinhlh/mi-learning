import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  static const String courseDetail = "/course";
}

abstract class CourseDetailRemoteDataSource extends BaseApi {
  Future<Either<Failure, Course>> getCourseDetail(String courseId);
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
}
