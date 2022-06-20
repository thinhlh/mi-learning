part of 'auth_page_bloc.dart';

abstract class AuthPageState {
  const AuthPageState();
}

class AuthPageInitialState extends AuthPageState {
  final bool isLogin;
  final Role? role;
  final ScreenStatus screenStatus;

  AuthPageInitialState({
    required this.isLogin,
    required this.role,
    required this.screenStatus,
  });

  AuthPageInitialState copyWith({
    bool? isLogin,
    Role? role,
    ScreenStatus? screenStatus,
  }) =>
      AuthPageInitialState(
        isLogin: isLogin ?? this.isLogin,
        role: role ?? this.role,
        screenStatus: screenStatus ?? this.screenStatus,
      );
}

class AuthPageSuccessState extends AuthPageState {}
