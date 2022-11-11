import 'package:mi_learning/app/user/data/datasources/user_remote_data_souce.dart';
import 'package:mi_learning/app/user/data/repositories/user_repository_impl.dart';
import 'package:mi_learning/app/user/domain/repositories/user_repository.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class UserInjectionContainer extends InjectionContainer {
  UserInjectionContainer._internal();

  static final UserInjectionContainer instance =
      UserInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(getIt()));

    getIt.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl());
  }
}
