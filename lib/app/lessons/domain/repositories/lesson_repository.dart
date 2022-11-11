import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/lessons/domain/usecases/create_note_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_finished_status_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_playback_use_case.dart';
import 'package:mi_learning/base/failure.dart';

abstract class LessonRepository {
  Future<Either<Failure, Course>> getCourseDetail(
    LessonGetCourseDetailParams params,
  );
  Future<Either<Failure, bool>> createNote(CreateNoteParams params);

  Future<Either<Failure, bool>> updateLessonPlayback(
    UpdateLessonPlaybackParams params,
  );

  Future<Either<Failure, bool>> updateLessonFinished(
    UpdateLessonFinishedStatusParams params,
  );
}
