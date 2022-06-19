import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explorer_for_you_page_event.dart';
part 'explorer_for_you_page_state.dart';

class ExplorerForYouPageBloc extends Bloc<ExplorerForYouPageEvent, ExplorerForYouPageState> {
  ExplorerForYouPageBloc() : super(ExplorerForYouPageInitial()) {
    on<ExplorerForYouPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
