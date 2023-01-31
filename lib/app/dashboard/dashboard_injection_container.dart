import 'package:mi_learning/app/course_detail/data/datasources/course_detail_remote_data_source.dart';
import 'package:mi_learning/app/course_detail/data/repositories/course_detail_repository_impl.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/app/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:mi_learning/app/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:mi_learning/app/dashboard/domain/repository/dashboard_repository.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_my_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class DashboardInjectionContainer extends InjectionContainer {
  DashboardInjectionContainer._internal();

  static final DashboardInjectionContainer instance =
      DashboardInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetBasicUserInfoUseCase>(
        () => GetBasicUserInfoUseCase(getIt()));

    getIt.registerLazySingleton<GetMyCoursesUseCase>(
        () => GetMyCoursesUseCase(getIt()));

    getIt.registerLazySingleton<GetRecommendedCourseUseCase>(
        () => GetRecommendedCourseUseCase(getIt()));

    getIt.registerLazySingleton<DashboardRepository>(
        () => DashboardRepositoryImpl(getIt()));

    getIt.registerLazySingleton<DashboardRemoteDataSource>(
        () => DashboardRemoteDataSourceImpl());
  }
}
