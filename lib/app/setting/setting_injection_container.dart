import 'package:mi_learning/app/setting/data/datasources/setting_local_data_source.dart';
import 'package:mi_learning/app/setting/data/datasources/setting_remote_data_souce.dart';
import 'package:mi_learning/app/setting/data/repositories/setting_repository_impl.dart';
import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/app/setting/domain/usecases/sign_out_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class SettingInjectionContainer extends InjectionContainer {
  SettingInjectionContainer._internal();

  static final SettingInjectionContainer instance =
      SettingInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(getIt()));
    getIt.registerLazySingleton<ChangePasswordUseCase>(
        () => ChangePasswordUseCase(getIt()));

    getIt.registerLazySingleton<SettingRepository>(
        () => SettingRepositoryImpl(getIt(), getIt()));

    getIt.registerLazySingleton<SettingRemoteDataSource>(
        () => SettingRemoteDataSourceImpl());

    getIt.registerLazySingleton<SettingLocalDataSource>(
        () => SettingLocalDataSourceImpl());
  }
}
