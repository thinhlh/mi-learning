import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/setting/domain/usecases/sign_out_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

part 'setting_page_event.dart';
part 'setting_page_state.dart';

class SettingPageBloc extends Bloc<SettingPageEvent, SettingPageState> {
  final SignOutUseCase _signOutUseCase;

  SettingPageBloc(this._signOutUseCase) : super(SettingPageInitial()) {
    on<SettingPageSignOutEvent>((event, emit) async {
      emit(SettingPageLoadingState());

      await _signOut().then(
        (value) => emit(
          SettingPageLoggedOutState(),
        ),
      );
    });
  }

  void signOut() {
    add(SettingPageSignOutEvent());
  }

  Future<Either<Failure, bool>> _signOut() async {
    return _signOutUseCase(NoParams());
  }
}
