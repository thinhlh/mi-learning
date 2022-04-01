import 'package:mi_learning/app/home/data/datasources/test_remote_data_source.dart';
import 'package:mi_learning/app/home/data/repositories/test_repository_impl.dart';
import 'package:mi_learning/app/home/domain/repositories/test_repository.dart';
import 'package:mi_learning/app/home/domain/usecases/check_connection_usecase.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class TestInjectionContainer extends InjectionContainer {
  TestInjectionContainer._internal();

  static final TestInjectionContainer instance =
      TestInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton(() => CheckConnectionUseCase(getIt()));

    getIt.registerLazySingleton<TestRepository>(
        () => TestRepositoryImpl(getIt()));

    getIt.registerLazySingleton<TestRemoteDataSource>(
        () => TestRemoteDataSourceImpl());
  }
}
