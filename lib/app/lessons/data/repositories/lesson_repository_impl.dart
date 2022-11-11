import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessons/data/datasources/lesson_remote_data_source.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/app/lessons/domain/usecases/create_note_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_finished_status_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_playback_use_case.dart';
import 'package:mi_learning/base/failure.dart';

class LessonRepositoryImpl implements LessonRepository {
  final LessonRemoteDataSource _lessonRemoteDataSource;

  LessonRepositoryImpl(
    this._lessonRemoteDataSource,
  );

  @override
  Future<Either<Failure, Course>> getCourseDetail(
    LessonGetCourseDetailParams params,
  ) {
    return _lessonRemoteDataSource.getCourseDetail(params);
  }

  @override
  Future<Either<Failure, bool>> createNote(CreateNoteParams params) {
    return _lessonRemoteDataSource.createNote(params);
  }

  @override
  Future<Either<Failure, bool>> updateLessonPlayback(
    UpdateLessonPlaybackParams params,
  ) {
    return _lessonRemoteDataSource.updatePlayback(params);
  }

  @override
  Future<Either<Failure, bool>> updateLessonFinished(
      UpdateLessonFinishedStatusParams params) {
    return _lessonRemoteDataSource.updateLessonFinishedStatus(params);
  }
}
