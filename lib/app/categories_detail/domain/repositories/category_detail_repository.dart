import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/categories_detail/domain/usecases/get_courses_by_category_use_case.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/base/failure.dart';

abstract class CategoryDetailRepository {
  Future<Either<Failure, List<Course>>> getCoursesByCategory(
    GetCoursesByCategoryUseCaseParams params,
  );
}
