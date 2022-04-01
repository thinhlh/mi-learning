import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/home/data/datasources/test_remote_data_source.dart';
import 'package:mi_learning/app/home/domain/entities/home_entity.dart';
import 'package:mi_learning/app/home/domain/repositories/test_repository.dart';
import 'package:mi_learning/base/failure.dart';

class TestRepositoryImpl implements TestRepository {
  final TestRemoteDataSource _remoteDataSource;

  TestRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, TestEntity>> checkConnection() async {
    return _remoteDataSource.checkConnection();
  }
}
