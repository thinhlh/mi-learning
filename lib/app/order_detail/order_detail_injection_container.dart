import 'package:mi_learning/app/course_detail/data/datasources/course_detail_remote_data_source.dart';
import 'package:mi_learning/app/course_detail/data/repositories/course_detail_repository_impl.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/order_detail/domain/usecases/checkout_usecase.dart';
import 'package:mi_learning/app/user/data/datasources/user_remote_data_souce.dart';
import 'package:mi_learning/app/user/data/repositories/user_repository_impl.dart';
import 'package:mi_learning/app/user/domain/repositories/user_repository.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class OrderDetailInjectionContainer extends InjectionContainer {
  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetBasicUserInfoUseCase>(
      () => GetBasicUserInfoUseCase(getIt()),
    );

    getIt.registerLazySingleton<CheckoutUseCase>(
      () => CheckoutUseCase(getIt()),
    );

    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getIt()),
    );

    getIt.registerLazySingleton<CourseDetailRepository>(
      () => CourseDetailRepositoryImpl(getIt()),
    );

    getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(),
    );

    getIt.registerLazySingleton<CourseDetailRemoteDataSource>(
      () => CourseDetailRemoteDataSourceImpl(),
    );
  }
}
