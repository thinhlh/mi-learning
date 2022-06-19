import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/saved_course/domain/get_saved_courses_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

part 'saved_course_page_event.dart';
part 'saved_course_page_state.dart';

class SavedCoursePageBloc
    extends Bloc<SavedCoursePageEvent, SavedCoursePageState> {
  final GetSavedCoursesUseCase _getSavedCoursesUseCase;

  SavedCoursePageBloc(this._getSavedCoursesUseCase)
      : super(SavedCoursePageInitialState()) {
    on<SavedCoursePageGetCoursesEvent>((event, emit) async {
      emit(SavedCoursePageLoadingState());

      final result = await _getSavedCoursesUseCase(NoParams());

      result.fold(
        (failure) => emit(
          SavedCoursePageFailedState(message: failure.message),
        ),
        (result) => emit(
          SavedCoursePageLoadedState(courses: result),
        ),
      );
    });
  }

  void getSavedCourses() {
    add(SavedCoursePageGetCoursesEvent());
  }
}
