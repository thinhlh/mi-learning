import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/domain/repository/dashboard_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetMyCoursesUseCase extends BaseUseCase<NoParams, List<Course>> {
  final DashboardRepository _dashboardRepository;

  GetMyCoursesUseCase(this._dashboardRepository);

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) {
    return _dashboardRepository.getMyCourses();
  }
}
