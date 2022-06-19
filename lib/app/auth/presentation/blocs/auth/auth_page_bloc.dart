import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/role.dart';
import 'package:mi_learning/base/failure.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  // Usecases
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthPageBloc(
    this._signInUseCase,
    this._signUpUseCase,
  ) : super(AuthPageStateInitial(
          isLogin: true,
          role: Role.student,
        )) {
    on<AuthPageGoToSignInEvent>((event, emit) {
      if (state is AuthPageStateInitial) {
        emit((state as AuthPageStateInitial).copyWith(isLogin: true));
      }
    });
    on<AuthPageGoToSignUpEvent>((event, emit) {
      if (state is AuthPageStateInitial) {
        emit((state as AuthPageStateInitial).copyWith(isLogin: false));
      }
    });
    on<AuthPageChangeRoleEvent>((event, emit) {
      if (state is AuthPageStateInitial) {
        emit((state as AuthPageStateInitial).copyWith(role: event.role));
      }
    });
  }

  // controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  // Methods

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    nameController.dispose();
    occupationController.dispose();
    return super.close();
  }

  void goToSignUp() {
    if (state is AuthPageStateInitial &&
        (state as AuthPageStateInitial).isLogin == false) {
      add(AuthPageGoToSignUpEvent());
    }
  }

  void goToSignIn() {
    if (state is AuthPageStateInitial &&
        (state as AuthPageStateInitial).isLogin == true) {
      add(AuthPageGoToSignInEvent());
    }
  }

  void changeRole(Role? role) {
    add(AuthPageChangeRoleEvent(role));
  }

  Future<Either<Failure, bool>> signIn() {
    return _signInUseCase(
      SignInRequestParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  Future<Either<Failure, dynamic>> signUp() {
    return _signUpUseCase(
      SignUpRequestParams(
        email: emailController.text,
        password: passwordController.text,
        birthday: '',
        name: nameController.text,
        occupation: occupationController.text,
        role: 'Student'?.toLowerCase() ?? '',
      ),
    );
  }
}
