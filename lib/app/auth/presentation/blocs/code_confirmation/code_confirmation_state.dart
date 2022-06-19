part of 'code_confirmation_bloc.dart';

class CodeConfirmationState extends Equatable {
  final String code;
  const CodeConfirmationState(this.code);

  @override
  List<Object> get props => [code];
}
