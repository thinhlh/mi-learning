import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explorer_free_page_event.dart';
part 'explorer_free_page_state.dart';

class ExplorerFreePageBloc extends Bloc<ExplorerFreePageEvent, ExplorerFreePageState> {
  ExplorerFreePageBloc() : super(ExplorerFreePageInitial()) {
    on<ExplorerFreePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
