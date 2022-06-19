import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_detail_test_page_event.dart';
part 'schedule_detail_test_page_state.dart';

class ScheduleDetailTestPageBloc extends Bloc<ScheduleDetailTestPageEvent, ScheduleDetailTestPageState> {
  ScheduleDetailTestPageBloc() : super(ScheduleDetailTestPageInitial()) {
    on<ScheduleDetailTestPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
