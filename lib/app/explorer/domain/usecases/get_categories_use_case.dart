import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/explorer/domain/repositories/explorer_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetCategoriesUseCase implements BaseUseCase<NoParams, List<Category>> {
  final ExplorerRepository _explorerRepository;

  GetCategoriesUseCase(
    this._explorerRepository,
  );

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) {
    return _explorerRepository.getCategories();
  }
}
