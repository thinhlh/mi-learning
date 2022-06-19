import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_explorer_courses_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

part 'explorer_page_event.dart';
part 'explorer_page_state.dart';

class ExplorerPageBloc extends Bloc<ExplorerPageEvent, ExplorerPageState> {
  final GetExplorerCoursesUseCase _getExplorerCoursesUseCase;

  ExplorerPageBloc(this._getExplorerCoursesUseCase)
      : super(ExplorerPageInitialState()) {
    on<ExplorerPageGetExplorerCoursesEvent>((event, emit) async {
      emit(ExplorerPageLoadingState());

      final result = await _getExplorerCoursesUseCase(NoParams());

      emit(
        result.fold(
          (failure) => ExplorerPageFailedState(message: failure.message),
          (value) => ExplorerPageLoadedState(courses: value),
        ),
      );
    });
  }

  void getExplorerCourses() {
    add(ExplorerPageGetExplorerCoursesEvent());
  }
}
