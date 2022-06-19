part of 'change_password_page_bloc.dart';

abstract class ChangePasswordPageState extends Equatable {
  const ChangePasswordPageState();

  @override
  List<Object> get props => [];
}

class ChangePasswordPageInitialState extends ChangePasswordPageState {}

class ChangePasswordPageLoadingState extends ChangePasswordPageState {}

class ChangePasswordPageSuccessState extends ChangePasswordPageState {}

class ChangePasswordPageFailedState extends ChangePasswordPageState {
  final String message;

  ChangePasswordPageFailedState({required this.message});
}
