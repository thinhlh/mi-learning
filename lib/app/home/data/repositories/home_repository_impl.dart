import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/home/data/datasources/home_remote_data_source.dart';
import 'package:mi_learning/app/home/domain/entities/home_entity.dart';
import 'package:mi_learning/app/home/domain/repositories/home_repository.dart';
import 'package:mi_learning/base/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, HomeEntity>> checkConnection() async {
    return _remoteDataSource.checkConnection();
  }
}
