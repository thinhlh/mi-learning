part of 'forgot_password_page_bloc.dart';

abstract class ForgotPasswordPageState extends Equatable {
  const ForgotPasswordPageState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordPageInitialState extends ForgotPasswordPageState {}

class ForgotPasswordPageTimerState extends ForgotPasswordPageState {
  final Timer countDownTimer;

  ForgotPasswordPageTimerState(this.countDownTimer);
}

class ForgotPasswordPageSuccessState extends ForgotPasswordPageState {}

class ForgotPasswordPageFailedState extends ForgotPasswordPageState {
  final String message;

  ForgotPasswordPageFailedState(this.message);
}
