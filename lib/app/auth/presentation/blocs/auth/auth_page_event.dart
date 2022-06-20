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

class AuthPageSignInEvent extends AuthPageEvent {
  final String email;
  final String password;

  AuthPageSignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthPageSignUpEvent extends AuthPageEvent {
  final String email;
  final String password;
  final String name;
  final String occupation;
  final String role;
  final String birthday;

  AuthPageSignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.occupation,
    required this.role,
    required this.birthday,
  });

  @override
  List<Object> get props => [email, password, name, occupation, role, birthday];
}
