import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_schedule_of_date_use_case.dart';
import 'package:mi_learning/base/failure.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, List<DateTime>>> getDatesHasSchedules();
  Future<Either<Failure, List<Schedule>>> getSchedulesOfDate(
    GetSchedulesOfDateParam params,
  );
}
