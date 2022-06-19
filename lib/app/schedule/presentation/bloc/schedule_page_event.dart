part of 'schedule_page_bloc.dart';

abstract class SchedulePageEvent extends Equatable {
  const SchedulePageEvent();

  @override
  List<Object> get props => [];
}

class SchedulePageGetDatesHasSchedulesEvent extends SchedulePageEvent {}

class SchedulePageGetSchedulesOfDateEvent extends SchedulePageEvent {
  final DateTime date;

  SchedulePageGetSchedulesOfDateEvent({required this.date});

  @override
  List<Object> get props => [date];
}

class SchedulePageChangeSelectedAndFocusedDateEvent extends SchedulePageEvent {
  final DateTime selectedDate;
  final DateTime focusedDate;

  SchedulePageChangeSelectedAndFocusedDateEvent({
    required this.selectedDate,
    required this.focusedDate,
  });
}
