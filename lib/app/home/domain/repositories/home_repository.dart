import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/home/domain/entities/home_entity.dart';
import 'package:mi_learning/base/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> checkConnection();
}
