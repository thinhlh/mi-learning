import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  final String courseDetail = '/course/detail';
  final String createNote = '/note';
}

abstract class LessonRemoteDataSource extends BaseApi with _Endpoint {
  Future<Either<Failure, CourseDetail>> getCourseDetail(
      LessonGetCourseDetailParams params);

  Future<Either<Failure, bool>> postNote(
      String content, String lessonId, String createdAt);
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

  @override
  Future<Either<Failure, bool>> postNote(
      String content, String lessonId, String createdAt) async {
    try {
      final data = {
        'content': 'content',
        'lessonId': 'aab0fd20-4aa4-48db-8b3d-979e7d59a432',
        'createdAt': 10,
      };
      final result = await post(createNote, data: data);

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}