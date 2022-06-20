import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';

abstract class LessonRepository {
  Future<Either<Failure, Course>> getCourseDetail(
    LessonGetCourseDetailParams params,
  );
  Future<Either<Failure, bool>> postNote(
      String content, String lessonId, int createdAt);
}
