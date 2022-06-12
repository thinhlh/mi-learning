import 'package:mi_learning/app/lessions/data/datasources/lesson_remote_data_source.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessions/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';

class LessonRepositoryImpl implements LessonRepository {
  final LessonRemoteDataSource _lessonRemoteDataSource;

  LessonRepositoryImpl(
    this._lessonRemoteDataSource,
  );

  @override
  Future<Either<Failure, CourseDetail>> getCourseDetail(
    LessonGetCourseDetailParams params,
  ) {
    return _lessonRemoteDataSource.getCourseDetail(params);
  }

  @override
  Future<Either<Failure, bool>> postNote(
      String content, String lessonId, int createdAt) {
    return _lessonRemoteDataSource.postNote(content, lessonId, createdAt);
  }
}
