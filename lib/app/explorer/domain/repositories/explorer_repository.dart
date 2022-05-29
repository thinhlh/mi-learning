import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/base/failure.dart';

abstract class ExplorerRepository {
  Future<Either<Failure, List<Course>>> getExplorerCourses();
  Future<Either<Failure, List<Category>>> getCategories();
}
