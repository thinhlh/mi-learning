import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/base/failure.dart';

abstract class CourseDetailRepository {
  Future<Either<Failure, Course>> getCourseDetail(String courseId);
}
