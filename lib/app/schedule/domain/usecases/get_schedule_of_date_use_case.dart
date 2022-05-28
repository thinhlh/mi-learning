import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/repositories/schedule_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetSchedulesOfDateParam with Params {
  final DateTime date;

  GetSchedulesOfDateParam({required this.date});
}

class GetSchedulesOfDateUseCase
    extends BaseUseCase<GetSchedulesOfDateParam, List<Schedule>> {
  final ScheduleRepository scheduleRepository;

  GetSchedulesOfDateUseCase(this.scheduleRepository);

  @override
  Future<Either<Failure, List<Schedule>>> call(GetSchedulesOfDateParam params) {
    return scheduleRepository.getSchedulesOfDate(params);
  }
}
