import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_chosen_page_event.dart';
part 'timer_chosen_page_state.dart';

class TimerChosenPageBloc extends Bloc<TimerChosenPageEvent, TimerChosenPageState> {
  TimerChosenPageBloc() : super(TimerChosenPageInitial()) {
    on<TimerChosenPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
