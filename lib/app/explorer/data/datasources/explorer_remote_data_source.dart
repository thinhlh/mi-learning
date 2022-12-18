import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/get_course_type.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  String explorerCourses = '/courses/bulk';
  String categories = '/categories';
}

abstract class ExplorerRemoteDataSource extends BaseApi with _Endpoint {
  Future<Either<Failure, List<Course>>> getExplorerCourses();
  Future<Either<Failure, List<Category>>> getCategories();
}

class ExplorerRemoteDataSourceImpl extends ExplorerRemoteDataSource {
  @override
  Future<Either<Failure, List<Course>>> getExplorerCourses() async {
    try {
      final result = await get(explorerCourses, query: {
        "type": GetCourseType.ALL.name,
      });

      return Right(
        (result.data as List<dynamic>)
            .map<Course>((rawCourse) => Course.fromMap(rawCourse))
            .toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final result = await get(categories);

      return Right(
        (result.data as List<dynamic>)
            .map<Category>((rawCategory) => Category.fromMap(rawCategory))
            .toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
