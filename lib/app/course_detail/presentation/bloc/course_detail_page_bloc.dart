import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/interceptors/dio_logger.dart';

part 'course_detail_page_event.dart';
part 'course_detail_page_state.dart';

class CourseDetailPageBloc
    extends Bloc<CourseDetailPageEvent, CourseDetailPageState> {
  final GetCourseDetailUseCase _getCourseDetailUseCase;
  final ToggleSaveCourseUseCase _toggleSaveCourseUseCase;

  CourseDetailPageBloc(
    this._getCourseDetailUseCase,
    this._toggleSaveCourseUseCase,
  ) : super(CourseDetailPageInitialState()) {
    on<CourseDetailPageGetCourseDetailEvent>((event, emit) async {
      emit(CourseDetailPageLoadingState());
      final result =
          await _getCourseDetailUseCase(GetCourseDetailParams(event.courseId));

      result.fold(
        (failure) =>
            emit(CourseDetailPageFailedState(message: failure.message)),
        (data) => emit(
          CourseDetailPageLoadedState(course: data),
        ),
      );
    });

    on<CourseDetailPageToggleSaveCourseEvent>((event, emit) async {
      if (state is CourseDetailPageLoadedState) {
        final course = (state as CourseDetailPageLoadedState).course;

        emit(CourseDetailPageLoadingState());
        final result = await _toggleSaveCourseUseCase(
          ToggleSaveCourseParams(
            courseId: event.courseId,
            saved: !course.saved,
          ),
        );

        emit(result.fold(
          (l) => CourseDetailPageFailedState(message: l.message),
          (result) => CourseDetailPageLoadedState(
            course: course.copyWith(
              saved: result,
            ),
          ),
        ));
      }
    });

    on<CourseDetailPageReloadCourseEvent>(
      (event, emit) => emit(
        CourseDetailPageLoadedState(course: event.course),
      ),
    );
  }

  void getCourseDetail(String courseId) {
    add(CourseDetailPageGetCourseDetailEvent(courseId: courseId));
  }

  void toggleSaveCourse(String courseId) {
    add(CourseDetailPageToggleSaveCourseEvent(courseId: courseId));
  }

  void reloadCourse(Course course) {
    add(CourseDetailPageReloadCourseEvent(course: course));
  }
}
