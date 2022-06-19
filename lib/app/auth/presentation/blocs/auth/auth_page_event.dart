part of 'auth_page_bloc.dart';

abstract class AuthPageEvent extends Equatable {
  const AuthPageEvent();

  @override
  List<Object> get props => [];
}

class AuthPageGoToSignUpEvent extends AuthPageEvent {}

class AuthPageGoToSignInEvent extends AuthPageEvent {}

class AuthPageChangeRoleEvent extends AuthPageEvent {
  final Role? role;

  AuthPageChangeRoleEvent(this.role);
}
