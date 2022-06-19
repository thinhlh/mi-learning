import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/test/domain/usecases/check_connection_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

part 'test_page_event.dart';
part 'test_page_state.dart';

class TestPageBloc extends Bloc<TestPageEvent, TestPageState> {
  final CheckConnectionUseCase _checkConnectionUseCase;

  TestPageBloc(this._checkConnectionUseCase) : super(TestPageInitialState()) {
    on<TestPageCheckConnectionEvent>((event, emit) async {
      emit(TestPageLoadingState());

      final result = await _checkConnectionUseCase(NoParams());

      emit(
        result.fold(
          (l) => TestPageFailedState(message: l.message),
          (r) => TestPageLoadedState(message: r.message),
        ),
      );
    });
  }

  void checkConnection() => add(TestPageCheckConnectionEvent());
}
