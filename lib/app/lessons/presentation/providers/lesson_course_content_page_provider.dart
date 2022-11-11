import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/section.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_finished_status_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessonCourseContentPageProvider extends LoadingProvider {
  final UpdateLessonFinishedUseCase _updateLessonFinishedUseCase;

  late Course _course;
  Course get course => _course;

  LessonCourseContentPageProvider(
    this._updateLessonFinishedUseCase, {
    required Course course,
  }) {
    _course = course;
  }

  List<Section> get sections => _course.sections;

  Future<Either<Failure, bool>> updateLessonStatus(
    UpdateLessonFinishedStatusParams params,
  ) async {
    return await _updateLessonFinishedUseCase.call(params);
  }
}
