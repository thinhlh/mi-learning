import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  final String courseDetail = '/course/detail';
}

abstract class LessonRemoteDataSource extends BaseApi with _Endpoint {
  Future<Either<Failure, CourseDetail>> getCourseDetail(
      LessonGetCourseDetailParams params);
}

class LessonRemoteDataSourceImpl extends LessonRemoteDataSource {
  @override
  Future<Either<Failure, CourseDetail>> getCourseDetail(
      LessonGetCourseDetailParams params) async {
    try {
      final result = await get(
        courseDetail,
        query: {
          'courseId': params.courseId,
        },
      );

      return Right(CourseDetail.fromMap(result.data));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
