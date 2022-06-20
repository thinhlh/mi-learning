import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class LessonGetCourseDetailParams implements Params {
  final String courseId;

  LessonGetCourseDetailParams(this.courseId);
}

class LessonGetCourseDetailUseCase
    implements BaseUseCase<LessonGetCourseDetailParams, Course> {
  final LessonRepository _lessonRepository;

  LessonGetCourseDetailUseCase(this._lessonRepository);

  @override
  Future<Either<Failure, Course>> call(
    LessonGetCourseDetailParams params,
  ) {
    return _lessonRepository.getCourseDetail(params);
  }
}
