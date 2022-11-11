import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/rating.dart';
import 'package:mi_learning/app/course_detail/data/datasources/course_detail_remote_data_source.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/submit_review_use_case.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
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

  @override
  Future<Either<Failure, bool>> toggleSaveCourse(
      ToggleSaveCourseParams params) {
    return _courseDetailRemoteDataSource.toggleSaveCourse(params);
  }

  @override
  Future<Either<Failure, List<Course>>> getSavedCourse() async {
    return _courseDetailRemoteDataSource.getSavedCourses();
  }

  @override
  Future<Either<Failure, bool>> checkout(String courseId) {
    return _courseDetailRemoteDataSource.checkout(courseId);
  }

  @override
  Future<Either<Failure, Rating>> createRating(SubmitReviewParams params) {
    return _courseDetailRemoteDataSource.createRating(params);
  }
}
