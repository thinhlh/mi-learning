import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/schedule/data/datasources/schedule_remote_datasource.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/repositories/schedule_repository.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_schedule_of_date_use_case.dart';
import 'package:mi_learning/base/failure.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource _scheduleRemoteDataSource;

  ScheduleRepositoryImpl(this._scheduleRemoteDataSource);

  @override
  Future<Either<Failure, List<DateTime>>> getDatesHasSchedules() async {
    return _scheduleRemoteDataSource.getDatesHasSchedules();
  }

  @override
  Future<Either<Failure, List<Schedule>>> getSchedulesOfDate(
      GetSchedulesOfDateParam param) {
    return _scheduleRemoteDataSource.getSchedulesOfDate(
      param.date,
    );
  }
}
