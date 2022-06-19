import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'code_confirmation_event.dart';
part 'code_confirmation_state.dart';

class CodeConfirmationBloc
    extends Bloc<CodeConfirmationEvent, CodeConfirmationState> {
  CodeConfirmationBloc() : super(const CodeConfirmationState("")) {
    on<CodeConfirmationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void codeEntered(String code) {
    add(CodeConfirmationCompletedEvent(code));
  }
}
