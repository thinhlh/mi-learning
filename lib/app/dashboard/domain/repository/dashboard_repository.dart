import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/base/failure.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<MyCourse>>> getMyCourses();
  Future<Either<Failure, List<RecommendedCourse>>> getRecommendedCourse();
}
