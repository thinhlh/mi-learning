import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  final String courseDetail = '/course/detail';
  final String createNote = '/note';
}

abstract class LessonRemoteDataSource extends BaseApi with _Endpoint {
  Future<Either<Failure, Course>> getCourseDetail(
    LessonGetCourseDetailParams params,
  );

  Future<Either<Failure, bool>> postNote(
    String content,
    String lessonId,
    int createdAt,
    String? id,
  );
}

class LessonRemoteDataSourceImpl extends LessonRemoteDataSource {
  @override
  Future<Either<Failure, Course>> getCourseDetail(
      LessonGetCourseDetailParams params) async {
    try {
      final result = await get(
        courseDetail,
        query: {
          'courseId': params.courseId,
        },
      );

      return Right(Course.fromMap(result.data));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> postNote(
    String content,
    String lessonId,
    int createdAt,
    String? id,
  ) async {
    try {
      final data = {
        'content': content,
        'lessonId': lessonId,
        'createdAt': createdAt,
        'id': id,
      };
      final result = await post(createNote, data: data);

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
