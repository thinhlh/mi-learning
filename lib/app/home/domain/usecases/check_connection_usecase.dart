import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/home/domain/entities/home_entity.dart';
import 'package:mi_learning/app/home/domain/repositories/home_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class CheckConnectionUseCase extends BaseUseCase<NoParams, HomeEntity> {
  final HomeRepository _repository;

  CheckConnectionUseCase(this._repository);

  @override
  Future<Either<Failure, HomeEntity>> call(NoParams params) async {
    return await _repository.checkConnection();
  }
}
