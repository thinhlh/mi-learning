import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessons/data/datasources/lesson_remote_data_source.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
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
  Future<Either<Failure, bool>> postNote(
    String content,
    String lessonId,
    int createdAt,
    String? id,
  ) {
    return _lessonRemoteDataSource.postNote(
      content,
      lessonId,
      createdAt,
      id,
    );
  }
}
