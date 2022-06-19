import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explorer_editor_choice_page_event.dart';
part 'explorer_editor_choice_page_state.dart';

class ExplorerEditorChoicePageBloc
    extends Bloc<ExplorerEditorChoicePageEvent, ExplorerEditorChoicePageState> {
  ExplorerEditorChoicePageBloc() : super(ExplorerEditorChoicePageInitial()) {
    on<ExplorerEditorChoicePageEvent>((event, emit) {});
  }
}
