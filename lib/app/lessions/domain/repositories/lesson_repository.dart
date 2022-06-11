import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';

abstract class LessonRepository {
  Future<Either<Failure, CourseDetail>> getCourseDetail(
    LessonGetCourseDetailParams params,
  );
  Future<Either<Failure, bool>> postNote(
      String content, String lessonId, String createdAt);
}
