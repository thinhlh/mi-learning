import 'package:mi_learning/app/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_local_data_souce.dart';
import 'package:mi_learning/app/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mi_learning/app/auth/data/repository/auth_repository_impl.dart';
import 'package:mi_learning/app/auth/domain/repository/auth_repository.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class AuthInjectionContainer extends InjectionContainer {
  AuthInjectionContainer._internal();

  static final AuthInjectionContainer instance =
      AuthInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(getIt()));
    getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
    getIt.registerLazySingleton<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(getIt()));

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(getIt(), getIt(), getIt()));

    getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());

    getIt.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl());

    getIt.registerLazySingleton<AuthFirebaseDataSource>(
        () => AuthFirebaseDataSourceImpl());
  }
}
