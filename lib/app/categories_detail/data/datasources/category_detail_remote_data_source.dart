import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Enpoint {
  final String getCoursesOfCategories = "/courses";
}

abstract class CategoryDetailRemoteDataSource extends BaseApi with _Enpoint {
  Future<Either<Failure, List<Course>>> getCoursesByCategory(String categoryId);
}

class CategoryDetailRemoteDataSourceImpl
    extends CategoryDetailRemoteDataSource {
  @override
  Future<Either<Failure, List<Course>>> getCoursesByCategory(
    String categoryId,
  ) async {
    try {
      final result = await get(getCoursesOfCategories, query: {
        "categoryId": categoryId,
      });

      return Right((result.data as List<dynamic>)
          .map((r) => Course.fromMap(r))
          .toList());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
