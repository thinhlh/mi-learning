part of 'change_password_page_bloc.dart';

abstract class ChangePasswordPageEvent extends Equatable {
  const ChangePasswordPageEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordPageSubmitEvent extends ChangePasswordPageEvent {}
