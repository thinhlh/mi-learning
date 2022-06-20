import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessonPageProvider extends LoadingProvider {
  final LessonGetCourseDetailUseCase _lessonGetCourseDetailUseCase;

  Course? course;
  Lesson? lesson;

  int _second = 0;
  int get second => _second;
  set second(int second) {
    _second = second;
    notifyListeners();
  }

  LessonPageProvider(this._lessonGetCourseDetailUseCase);
}
