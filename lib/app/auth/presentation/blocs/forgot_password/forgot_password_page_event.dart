part of 'forgot_password_page_bloc.dart';

abstract class ForgotPasswordPageEvent extends Equatable {
  const ForgotPasswordPageEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordPageSendEmailEvent extends ForgotPasswordPageEvent {
  final String email;

  ForgotPasswordPageSendEmailEvent({required this.email});
}

class ForgotPasswordPageStartTimerEvent extends ForgotPasswordPageEvent {}

class ForgotPasswordPageStopTimerEvent extends ForgotPasswordPageEvent {}
