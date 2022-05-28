import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/app/dashboard/domain/repository/dashboard_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetRecommendedCourseUseCase
    implements BaseUseCase<NoParams, List<RecommendedCourse>> {
  final DashboardRepository _dashboardRepository;

  GetRecommendedCourseUseCase(this._dashboardRepository);

  @override
  Future<Either<Failure, List<RecommendedCourse>>> call(NoParams params) {
    return _dashboardRepository.getRecommendedCourse();
  }
}
