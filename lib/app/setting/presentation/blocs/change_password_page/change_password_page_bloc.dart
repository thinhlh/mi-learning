import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/base/failure.dart';

part 'change_password_page_event.dart';
part 'change_password_page_state.dart';

class ChangePasswordPageBloc
    extends Bloc<ChangePasswordPageEvent, ChangePasswordPageState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ChangePasswordPageBloc(this._changePasswordUseCase)
      : super(ChangePasswordPageInitialState()) {
    on<ChangePasswordPageSubmitEvent>((event, emit) async {
      emit(ChangePasswordPageLoadingState());

      final result = await _changePassword();
      result.fold(
        (l) => ChangePasswordPageFailedState(message: l.message),
        (r) => r
            ? ChangePasswordPageFailedState(
                message: 'Current password and new password does not match.')
            : ChangePasswordPageSuccessState(),
      );
    });
  }

  void changePassword() {
    add(ChangePasswordPageSubmitEvent());
  }

  Future<Either<Failure, bool>> _changePassword() async {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password.isEmpty) {
      return Left(Failure(message: 'Password must not be empty'));
    } else if (password != confirmPassword) {
      return Left(Failure(message: 'Password confirmation does not match'));
    }

    return _changePasswordUseCase(
      ChangePasswordParams(
        currentPassword: currentPasswordController.text,
        newPassword: passwordController.text,
      ),
    );
  }

  @override
  Future<void> close() async {
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.close();
  }
}
