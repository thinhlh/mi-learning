import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/categories_detail/domain/repositories/category_detail_repository.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetCoursesByCategoryUseCaseParams implements Params {
  final String categoryId;

  GetCoursesByCategoryUseCaseParams({required this.categoryId});
}

class GetCoursesByCategoryUseCase
    implements BaseUseCase<GetCoursesByCategoryUseCaseParams, List<Course>> {
  final CategoryDetailRepository _categoriesDetailRepository;

  const GetCoursesByCategoryUseCase(this._categoriesDetailRepository);

  @override
  Future<Either<Failure, List<Course>>> call(
    GetCoursesByCategoryUseCaseParams params,
  ) {
    return _categoriesDetailRepository.getCoursesByCategory(params);
  }
}
