import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
import 'package:mi_learning/base/failure.dart';

abstract class CourseDetailRepository {
  Future<Either<Failure, Course>> getCourseDetail(String courseId);
  Future<Either<Failure, bool>> toggleSaveCourse(ToggleSaveCourseParams params);
  Future<Either<Failure, List<Course>>> getSavedCourse();
  Future<Either<Failure, bool>> checkout(String courseId);
}
