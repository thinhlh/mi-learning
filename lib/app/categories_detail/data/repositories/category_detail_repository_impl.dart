import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/categories_detail/data/datasources/category_detail_remote_data_source.dart';
import 'package:mi_learning/app/categories_detail/domain/repositories/category_detail_repository.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/categories_detail/domain/usecases/get_courses_by_category_use_case.dart';

class CategoryDetailRepositoryImpl implements CategoryDetailRepository {
  final CategoryDetailRemoteDataSource _categoriesDetailRemoteDataSource;

  const CategoryDetailRepositoryImpl(this._categoriesDetailRemoteDataSource);

  @override
  Future<Either<Failure, List<Course>>> getCoursesByCategory(
      GetCoursesByCategoryUseCaseParams params) {
    return _categoriesDetailRemoteDataSource.getCoursesByCategory(
      params.categoryId,
    );
  }
}
