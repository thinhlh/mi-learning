import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/course_detail/data/datasources/course_detail_remote_data_source.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/failure.dart';

class CourseDetailRepositoryImpl implements CourseDetailRepository {
  final CourseDetailRemoteDataSource _courseDetailRemoteDataSource;

  CourseDetailRepositoryImpl(
    this._courseDetailRemoteDataSource,
  );

  @override
  Future<Either<Failure, Course>> getCourseDetail(String courseId) {
    return _courseDetailRemoteDataSource.getCourseDetail(courseId);
  }
}
