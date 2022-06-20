import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/explorer/domain/repositories/explorer_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetExplorerCoursesUseCase implements BaseUseCase<NoParams, List<Course>> {
  final ExplorerRepository _explorerRepository;

  GetExplorerCoursesUseCase(this._explorerRepository);

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) {
    return _explorerRepository.getExplorerCourses();
  }
}
