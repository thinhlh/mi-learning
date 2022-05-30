import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/lessions/data/datasources/lesson_remote_data_source.dart';
import 'package:mi_learning/app/lessions/data/repositories/lesson_repository_impl.dart';
import 'package:mi_learning/app/lessions/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class LessonInjectionContainer extends InjectionContainer {
  LessonInjectionContainer._internal();

  static final LessonInjectionContainer instance =
      LessonInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<LessonGetCourseDetailUseCase>(
        () => LessonGetCourseDetailUseCase(getIt()));
    getIt.registerLazySingleton<LessonRepository>(
        () => LessonRepositoryImpl(getIt()));
    getIt.registerLazySingleton<LessonRemoteDataSource>(
        () => LessonRemoteDataSourceImpl());
  }
}
