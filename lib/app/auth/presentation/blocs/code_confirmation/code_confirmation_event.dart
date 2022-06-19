part of 'code_confirmation_bloc.dart';

abstract class CodeConfirmationEvent extends Equatable {
  const CodeConfirmationEvent();

  @override
  List<Object> get props => [];
}

class CodeConfirmationCompletedEvent extends CodeConfirmationEvent {
  final String code;

  CodeConfirmationCompletedEvent(this.code);

  @override
  List<Object> get props => [code];
}
