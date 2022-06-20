import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_use_case.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/role.dart';
import 'package:mi_learning/base/presentation/blocs/screen_status.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  // Usecases
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthPageBloc(
    this._signInUseCase,
    this._signUpUseCase,
  ) : super(AuthPageInitialState(
          isLogin: true,
          role: null,
          screenStatus: ScreenStatus.none(),
        )) {
    on<AuthPageGoToSignInEvent>((event, emit) {
      if (state is AuthPageInitialState) {
        emit((state as AuthPageInitialState)
            .copyWith(isLogin: true, screenStatus: ScreenStatus.none()));
      }
    });
    on<AuthPageGoToSignUpEvent>((event, emit) {
      if (state is AuthPageInitialState) {
        emit((state as AuthPageInitialState)
            .copyWith(isLogin: false, screenStatus: ScreenStatus.none()));
      }
    });
    on<AuthPageChangeRoleEvent>((event, emit) {
      if (state is AuthPageInitialState) {
        emit((state as AuthPageInitialState)
            .copyWith(role: event.role, screenStatus: ScreenStatus.none()));
      }
    });

    on<AuthPageSignInEvent>((event, emit) async {
      String? errorMessage;

      if (state is AuthPageInitialState) {
        if (event.email.isEmpty || event.password.isEmpty) {
          errorMessage = 'Email or password must not be empty';
        } else if (!event.email.contains('@')) {
          errorMessage = 'Invalid email';
        } else if (event.password.length < 8) {
          errorMessage = 'Password must have at least 8 characters';
        }

        if (errorMessage != null) {
          emit(
            (state as AuthPageInitialState).copyWith(
              screenStatus: ScreenStatus.error(errorMessage),
            ),
          );
          return;
        }

        emit(
          (state as AuthPageInitialState)
              .copyWith(screenStatus: ScreenStatus.loading()),
        );

        await _signInUseCase(
          SignInRequestParams(
            email: event.email,
            password: event.password,
          ),
        ).then(
          (value) => emit(
            value.fold(
              (l) => (state as AuthPageInitialState)
                  .copyWith(screenStatus: ScreenStatus.error(l.message)),
              (r) => AuthPageSuccessState(),
            ),
          ),
        );
      }
    });

    on<AuthPageSignUpEvent>(
      (event, emit) async {
        String? errorMessage;

        if (event.email.isEmpty || event.password.isEmpty) {
          errorMessage = 'Email or password must not be empty';
        } else if (!event.email.contains('@')) {
          errorMessage = 'Invalid email';
        } else if (event.password.length < 8) {
          errorMessage = 'Password must have at least 8 characters';
        } else if (event.name.isEmpty) {
          errorMessage = 'Name cannot be empty';
        } else if (event.password != occupationController.text) {
          errorMessage = 'Confirmation password must match password';
        }

        if (errorMessage != null) {
          emit(
            (state as AuthPageInitialState).copyWith(
              screenStatus: ScreenStatus.error(errorMessage),
            ),
          );
          return;
        }

        emit(
          (state as AuthPageInitialState)
              .copyWith(screenStatus: ScreenStatus.loading()),
        );

        await _signUpUseCase(
          SignUpRequestParams(
            email: event.email,
            password: event.password,
            name: event.name,
            occupation: event.occupation,
            birthday: event.birthday,
            role: event.role,
          ),
        ).then(
          (value) => emit(
            value.fold(
              (l) => (state as AuthPageInitialState)
                  .copyWith(screenStatus: ScreenStatus.error(l.message)),
              (r) => AuthPageSuccessState(),
            ),
          ),
        );
      },
    );
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
    if (state is AuthPageInitialState &&
        (state as AuthPageInitialState).isLogin == true) {
      add(AuthPageGoToSignUpEvent());
    }
  }

  void goToSignIn() {
    if (((state is AuthPageInitialState)
        ? (state as AuthPageInitialState).isLogin == false
        : true)) {
      add(AuthPageGoToSignInEvent());
    }
  }

  void changeRole(Role? role) {
    add(AuthPageChangeRoleEvent(role));
  }

  void signIn() {
    add(
      AuthPageSignInEvent(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  void signUp() {
    add(
      AuthPageSignUpEvent(
        email: emailController.text,
        password: passwordController.text,
        birthday: '',
        name: nameController.text,
        occupation: occupationController.text,
        role: 'Student'.toLowerCase(),
      ),
    );
  }
}
