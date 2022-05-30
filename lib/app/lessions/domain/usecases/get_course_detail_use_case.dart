import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class LessonGetCourseDetailParams implements Params {
  final String courseId;

  LessonGetCourseDetailParams(this.courseId);
}

class LessonGetCourseDetailUseCase
    implements BaseUseCase<LessonGetCourseDetailParams, CourseDetail> {
  final LessonRepository _lessonRepository;

  LessonGetCourseDetailUseCase(this._lessonRepository);

  @override
  Future<Either<Failure, CourseDetail>> call(
    LessonGetCourseDetailParams params,
  ) {
    return _lessonRepository.getCourseDetail(params);
  }
}
