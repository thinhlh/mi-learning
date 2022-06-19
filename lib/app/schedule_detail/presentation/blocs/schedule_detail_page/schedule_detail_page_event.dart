part of 'schedule_detail_page_bloc.dart';

abstract class ScheduleDetailPageEvent extends Equatable {
  const ScheduleDetailPageEvent();

  @override
  List<Object> get props => [];
}

class ScheduleDetailPageChangeTimerEvent extends ScheduleDetailPageEvent {
  final int currentChosenTimer;

  const ScheduleDetailPageChangeTimerEvent({required this.currentChosenTimer});
}
