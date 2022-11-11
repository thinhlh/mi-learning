import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/base/failure.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<Course>>> getMyCourses();
  Future<Either<Failure, List<Course>>> getRecommendedCourse();
}
