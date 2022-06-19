part of 'auth_page_bloc.dart';

abstract class AuthPageState extends Equatable {
  const AuthPageState();

  @override
  List<Object> get props => [];
}

class AuthPageStateInitial extends AuthPageState {
  final bool isLogin;
  final Role? role;

  AuthPageStateInitial({
    required this.isLogin,
    required this.role,
  });

  @override
  List<Object> get props => [isLogin, role ?? Role.student];

  AuthPageStateInitial copyWith({bool? isLogin, Role? role}) =>
      AuthPageStateInitial(
        isLogin: isLogin ?? this.isLogin,
        role: role ?? this.role,
      );
}
