part of 'schedule_detail_page_bloc.dart';

class ScheduleDetailPageState extends Equatable {
  final int currentChosenTimer;

  const ScheduleDetailPageState({required this.currentChosenTimer});

  @override
  List<Object> get props => [currentChosenTimer];
}
