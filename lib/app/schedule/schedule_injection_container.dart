import 'package:mi_learning/app/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:mi_learning/app/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:mi_learning/app/schedule/domain/repositories/schedule_repository.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_dates_has_schedules_use_case.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_schedule_of_date_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class ScheduleInjectionContainer extends InjectionContainer {
  ScheduleInjectionContainer._internal();

  static final ScheduleInjectionContainer instance =
      ScheduleInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton(() => GetDatesHasSchedulesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetSchedulesOfDateUseCase(getIt()));

    getIt.registerLazySingleton<ScheduleRepository>(
        () => ScheduleRepositoryImpl(getIt()));

    getIt.registerLazySingleton<ScheduleRemoteDataSource>(
        () => ScheduleRemoteDataSourceImpl());
  }
}
