import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/lessons/domain/usecases/create_note_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_finished_status_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_playback_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  final String courseDetail = '/course/detail';
  final String createNoteUrl = '/note';
  final String updatePlaybackUrl = '/lesson/playback';
  final String updateLessonFinishedStatusUrl = '/lesson/status';
}

abstract class LessonRemoteDataSource extends BaseApi with _Endpoint {
  Future<Either<Failure, Course>> getCourseDetail(
    LessonGetCourseDetailParams params,
  );

  Future<Either<Failure, bool>> createNote(
    CreateNoteParams params,
  );

  Future<Either<Failure, bool>> updatePlayback(
    UpdateLessonPlaybackParams params,
  );

  Future<Either<Failure, bool>> updateLessonFinishedStatus(
    UpdateLessonFinishedStatusParams params,
  );
}

class LessonRemoteDataSourceImpl extends LessonRemoteDataSource {
  @override
  Future<Either<Failure, Course>> getCourseDetail(
      LessonGetCourseDetailParams params) async {
    try {
      final result = await get(
        courseDetail,
        query: {
          'courseId': params.courseId,
        },
      );

      return Right(Course.fromMap(result.data));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> createNote(CreateNoteParams params) async {
    try {
      final result = await post(createNoteUrl, data: params.toMap());

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePlayback(
    UpdateLessonPlaybackParams params,
  ) async {
    try {
      final result = await put(
        updatePlaybackUrl,
        data: params.toMap(),
      );

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> updateLessonFinishedStatus(
      UpdateLessonFinishedStatusParams params) async {
    try {
      final result = await put(
        updateLessonFinishedStatusUrl,
        data: params.toMap(),
      );

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
