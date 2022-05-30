import 'package:mi_learning/app/course_detail/data/datasources/course_detail_remote_data_source.dart';
import 'package:mi_learning/app/course_detail/data/repositories/course_detail_repository_impl.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class CourseDetailInjectionContainer extends InjectionContainer {
  CourseDetailInjectionContainer._internal();

  static final CourseDetailInjectionContainer instance =
      CourseDetailInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetCourseDetailUseCase>(
        () => GetCourseDetailUseCase(getIt()));
    getIt.registerLazySingleton<ToggleSaveCourseUseCase>(
        () => ToggleSaveCourseUseCase(getIt()));

    getIt.registerLazySingleton<CourseDetailRepository>(
        () => CourseDetailRepositoryImpl(getIt()));

    getIt.registerLazySingleton<CourseDetailRemoteDataSource>(
        () => CourseDetailRemoteDataSourceImpl());
  }
}
