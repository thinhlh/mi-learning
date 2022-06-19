import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_dates_has_schedules_use_case.dart';
import 'package:mi_learning/app/schedule/domain/usecases/get_schedule_of_date_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

part 'schedule_page_event.dart';
part 'schedule_page_state.dart';

class SchedulePageBloc extends Bloc<SchedulePageEvent, SchedulePageState> {
  final GetDatesHasSchedulesUseCase _getDatesHasSchedulesUseCase;
  final GetSchedulesOfDateUseCase _getSchedulesOfDateUseCase;

  SchedulePageBloc(
    this._getDatesHasSchedulesUseCase,
    this._getSchedulesOfDateUseCase,
  ) : super(SchedulePageState()) {
    on<SchedulePageGetDatesHasSchedulesEvent>((event, emit) async {
      final result = await _getDatesHasSchedulesUseCase(NoParams());

      result.fold(
        (l) {},
        (datesHasSchedule) => emit(
          state.copyWith(datesHasSchedule: datesHasSchedule),
        ),
      );
    });

    on<SchedulePageGetSchedulesOfDateEvent>((event, emit) async {
      final result = await _getSchedulesOfDateUseCase(
        GetSchedulesOfDateParam(date: event.date),
      );

      result.fold((l) => Left(l), (schedules) {
        emit(
          state.copyWith(scheduleOfSelectedDate: schedules),
        );
      });
    });
  }

  void getDatesHasSchedule() {
    add(SchedulePageGetDatesHasSchedulesEvent());
  }

  void getSchedulesOfDate() {
    add(SchedulePageGetSchedulesOfDateEvent(date: state.selectedDate));
  }

  void changeSelectedAndFocusedDate(
    DateTime selectedDate,
    DateTime focusedDate,
  ) {
    add(
      SchedulePageChangeSelectedAndFocusedDateEvent(
        selectedDate: selectedDate,
        focusedDate: focusedDate,
      ),
    );
  }
}
