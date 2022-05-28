import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_schedule_of_date_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';
import 'package:mi_learning/utils/date_time_helper.dart';

mixin _Endpoint {
  static const String datesHasSchedules = '/schedules/dates';
  static const String schedulesOfDate = '/schedules';
}

abstract class ScheduleRemoteDataSource extends BaseApi {
  Future<Either<Failure, List<DateTime>>> getDatesHasSchedules();
  Future<Either<Failure, List<Schedule>>> getSchedulesOfDate(DateTime date);
}

class ScheduleRemoteDataSourceImpl extends ScheduleRemoteDataSource {
  @override
  Future<Either<Failure, List<DateTime>>> getDatesHasSchedules() async {
    try {
      final result = await get(_Endpoint.datesHasSchedules);

      return Right((result.data as List<dynamic>)
          .map<DateTime>(
            (date) => DateTimeHelper.dateTimeFromServerDateTimeResponse(
                (date as List<dynamic>).cast<int>()),
          )
          .toList());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Schedule>>> getSchedulesOfDate(
      DateTime date) async {
    try {
      final result = await get(_Endpoint.schedulesOfDate,
          query: {'date': DateTimeHelper.format(date)});

      return Right((result.data as List<dynamic>)
          .map<Schedule>((rawSchedule) => Schedule.fromMap(rawSchedule))
          .toList());
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
