import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_playback_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessonPageProvider extends LoadingProvider {
  final LessonGetCourseDetailUseCase _lessonGetCourseDetailUseCase;
  final UpdateLessonPlaybackUseCase _updateLessonPlaybackUseCase;

  Course? _course;
  Lesson? _lesson;

  Course? get course => _course;
  Lesson? get lesson => _lesson;

  void initializeData(Course? course, Lesson? lesson) {
    _course = course;
    _lesson = lesson;
  }

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

    _updateLessonPlaybackUseCase(
      UpdateLessonPlaybackParams(
        lessonId: lesson?.id ?? "",
        playback: _playbackSecond,
      ),
    );
    notifyListeners();
  }

  LessonPageProvider(
    this._lessonGetCourseDetailUseCase,
    this._updateLessonPlaybackUseCase,
  );

  Future<Either<Failure, Course>> getCourseDetail() {
    return _lessonGetCourseDetailUseCase(
      LessonGetCourseDetailParams(course?.id ?? ""),
    ).then(
      (value) => value.fold(
        (l) => Left(l),
        (r) {
          course = r;
          return Right(r);
        },
      ),
    );
  }
}
