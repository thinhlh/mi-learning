import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/explorer/data/datasources/explorer_remote_data_source.dart';
import 'package:mi_learning/app/explorer/domain/repositories/explorer_repository.dart';
import 'package:mi_learning/base/failure.dart';

class ExplorerRepositoryImpl implements ExplorerRepository {
  final ExplorerRemoteDataSource _explorerRemoteDataSource;

  ExplorerRepositoryImpl(this._explorerRemoteDataSource);

  @override
  Future<Either<Failure, List<Course>>> getExplorerCourses() {
    return _explorerRemoteDataSource.getExplorerCourses();
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() {
    return _explorerRemoteDataSource.getCategories();
  }
}
