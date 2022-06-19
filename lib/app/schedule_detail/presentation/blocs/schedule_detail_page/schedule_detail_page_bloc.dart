import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_detail_page_event.dart';
part 'schedule_detail_page_state.dart';

class ScheduleDetailPageBloc
    extends Bloc<ScheduleDetailPageEvent, ScheduleDetailPageState> {
  ScheduleDetailPageBloc()
      : super(const ScheduleDetailPageState(currentChosenTimer: 0)) {
    on<ScheduleDetailPageChangeTimerEvent>((event, emit) {
      emit(
        ScheduleDetailPageState(
          currentChosenTimer: event.currentChosenTimer,
        ),
      );
    });
  }

  void updateTimer(int timer) {
    add(ScheduleDetailPageChangeTimerEvent(currentChosenTimer: timer));
  }
}
