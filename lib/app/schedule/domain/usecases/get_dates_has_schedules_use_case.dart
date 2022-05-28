import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/schedule/domain/repositories/schedule_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetDatesHasSchedulesUseCase
    extends BaseUseCase<NoParams, List<DateTime>> {
  final ScheduleRepository _scheduleRepository;

  GetDatesHasSchedulesUseCase(this._scheduleRepository);

  @override
  Future<Either<Failure, List<DateTime>>> call(NoParams params) {
    return _scheduleRepository.getDatesHasSchedules();
  }
}
