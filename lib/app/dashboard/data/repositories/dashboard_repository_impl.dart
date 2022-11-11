import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/dashboard/domain/repository/dashboard_repository.dart';
import 'package:mi_learning/base/failure.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _dashboardRemoteDataSource;

  DashboardRepositoryImpl(this._dashboardRemoteDataSource);

  @override
  Future<Either<Failure, List<Course>>> getMyCourses() {
    return _dashboardRemoteDataSource.getMyCourses();
  }

  @override
  Future<Either<Failure, List<Course>>> getRecommendedCourse() {
    return _dashboardRemoteDataSource.getRecommendedCourses();
  }
}
