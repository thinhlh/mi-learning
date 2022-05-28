import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/repository/dashboard_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetMyCoursesUseCase extends BaseUseCase<NoParams, List<MyCourse>> {
  final DashboardRepository _dashboardRepository;

  GetMyCoursesUseCase(this._dashboardRepository);

  @override
  Future<Either<Failure, List<MyCourse>>> call(NoParams params) {
    return _dashboardRepository.getMyCourses();
  }
}
