import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_dates_has_schedules_use_case.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_schedule_of_date_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class SchedulePageProvider extends LoadingProvider {
  // Usecases
  final GetDatesHasSchedulesUseCase _getDatesHasSchedulesUseCase;
  final GetSchedulesOfDateUseCase _getSchedulesOfDateUseCase;

  SchedulePageProvider(
    this._getDatesHasSchedulesUseCase,
    this._getSchedulesOfDateUseCase,
  );

  // Variables
  DateTime _selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  List<DateTime> _datesHasSchedule = [];
  List<Schedule> _scheduleOfSelectedDate = <Schedule>[];

  // Getters & Setters
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    getSchedulesOfDate();
    notifyListeners();
  }

  List<DateTime> get datesHasSchedule => _datesHasSchedule;
  set datesHasSchedule(List<DateTime> value) {
    _datesHasSchedule = value;
    notifyListeners();
  }

  List<Schedule> get scheduleOfSelectedDate => _scheduleOfSelectedDate;

  // Functions
  Future<Either<Failure, List<DateTime>>> getDatesHasSchedules() async {
    final result = await _getDatesHasSchedulesUseCase(NoParams());

    return result.fold(
      (l) => Left(l),
      (r) {
        datesHasSchedule = r;
        return Right(_datesHasSchedule);
      },
    );
  }

  Future<Either<Failure, List<Schedule>>> getSchedulesOfDate() async {
    final result = await _getSchedulesOfDateUseCase(
      GetSchedulesOfDateParam(date: _selectedDate),
    );

    return result.fold((l) => Left(l), (schedules) {
      _scheduleOfSelectedDate = schedules;
      notifyListeners();
      return Right(schedules);
    });
  }
}
