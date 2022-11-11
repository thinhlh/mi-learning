import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/test/domain/entities/home_entity.dart';
import 'package:mi_learning/base/failure.dart';

abstract class TestRepository {
  Future<Either<Failure, TestEntity>> checkConnection();
}
