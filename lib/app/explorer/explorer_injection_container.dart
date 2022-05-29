import 'package:mi_learning/app/explorer/data/datasources/explorer_remote_data_source.dart';
import 'package:mi_learning/app/explorer/data/repositories/explorer_repository_impl.dart';
import 'package:mi_learning/app/explorer/domain/repositories/explorer_repository.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_categories_use_case.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_explorer_courses_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class ExplorerInjectionContainer extends InjectionContainer {
  ExplorerInjectionContainer._internal();

  static final ExplorerInjectionContainer instance =
      ExplorerInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetExplorerCoursesUseCase>(
        () => GetExplorerCoursesUseCase(getIt()));

    getIt.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(getIt()));

    getIt.registerLazySingleton<ExplorerRepository>(
        () => ExplorerRepositoryImpl(getIt()));

    getIt.registerLazySingleton<ExplorerRemoteDataSource>(
        () => ExplorerRemoteDataSourceImpl());
  }
}
