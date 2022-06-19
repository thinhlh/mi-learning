import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explorer_premium_page_event.dart';
part 'explorer_premium_page_state.dart';

class ExplorerPremiumPageBloc extends Bloc<ExplorerPremiumPageEvent, ExplorerPremiumPageState> {
  ExplorerPremiumPageBloc() : super(ExplorerPremiumPageInitial()) {
    on<ExplorerPremiumPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
