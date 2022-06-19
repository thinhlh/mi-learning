import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/auth/domain/usecase/forget_password_use_case.dart';

part 'forgot_password_page_event.dart';
part 'forgot_password_page_state.dart';

class ForgotPasswordPageBloc
    extends Bloc<ForgotPasswordPageEvent, ForgotPasswordPageState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgotPasswordPageBloc(this._forgetPasswordUseCase)
      : super(ForgotPasswordPageInitialState()) {
    on<ForgotPasswordPageStartTimerEvent>((event, emit) {
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          emit(ForgotPasswordPageTimerState(timer));

          if (timer.tick == const Duration(minutes: 2).inSeconds) {
            _stopTimer();
          }
        },
      );
    });

    on<ForgotPasswordPageStopTimerEvent>((event, emit) {
      emit(ForgotPasswordPageInitialState());
    });

    on<ForgotPasswordPageSendEmailEvent>((event, emit) async {
      if (event.email.isEmpty) {
        emit(ForgotPasswordPageFailedState('Email can not be empty.'));
      }

      add(ForgotPasswordPageStartTimerEvent());

      final result =
          await _forgetPasswordUseCase(ForgetPasswordParams(event.email));
      await Future.delayed(const Duration(seconds: 3));

      result.fold(
        (l) => emit(ForgotPasswordPageFailedState(l.message)),
        (r) => emit(ForgotPasswordPageSuccessState()),
      );

      _stopTimer();
    });
  }

  void sendPasswordReset(String email) async {
    add(ForgotPasswordPageSendEmailEvent(email: email));
  }

  void _stopTimer() {
    add(ForgotPasswordPageStopTimerEvent());
  }

  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}
