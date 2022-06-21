import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessonPageProvider extends LoadingProvider {
  final LessonGetCourseDetailUseCase _lessonGetCourseDetailUseCase;

  Course? _course;
  Lesson? _lesson;

  Course? get course => _course;
  Lesson? get lesson => _lesson;

  set course(Course? course) {
    _course = course;
    notifyListeners();
  }

  set lesson(Lesson? lesson) {
    _lesson = lesson;
    notifyListeners();
  }

  int _playbackSecond = 0;
  int get playbackSecond => _playbackSecond;
  set playbackSecond(int second) {
    _playbackSecond = second;
    notifyListeners();
  }

  LessonPageProvider(this._lessonGetCourseDetailUseCase);

  Future<Either<Failure, Course>> getCourseDetail() {
    return _lessonGetCourseDetailUseCase(
      LessonGetCourseDetailParams(course?.id ?? ""),
    ).then((value) => value.fold((l) => Left(l), (r) {
          course = r;
          return Right(r);
        }));
  }
}
