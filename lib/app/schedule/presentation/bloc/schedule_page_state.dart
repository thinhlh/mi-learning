part of 'schedule_page_bloc.dart';

class SchedulePageState extends Equatable {
  final DateTime selectedDate;
  final DateTime focusedDate;
  final List<DateTime> datesHasSchedule;
  final List<Schedule> scheduleOfSelectedDate;

  SchedulePageState({
    DateTime? selectedDate,
    DateTime? focusedDate,
    List<DateTime>? datesHasSchedule,
    List<Schedule>? scheduleOfSelectedDate,
  })  : selectedDate = selectedDate ?? DateTime.now(),
        focusedDate = focusedDate ?? DateTime.now(),
        datesHasSchedule = <DateTime>[],
        scheduleOfSelectedDate = <Schedule>[];

  SchedulePageState copyWith({
    DateTime? selectedDate,
    DateTime? focusedDate,
    List<DateTime>? datesHasSchedule,
    List<Schedule>? scheduleOfSelectedDate,
  }) {
    return SchedulePageState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDate: focusedDate ?? this.focusedDate,
      datesHasSchedule: datesHasSchedule ?? this.datesHasSchedule,
      scheduleOfSelectedDate:
          scheduleOfSelectedDate ?? this.scheduleOfSelectedDate,
    );
  }

  @override
  List<Object> get props =>
      [selectedDate, focusedDate, datesHasSchedule, scheduleOfSelectedDate];
}
