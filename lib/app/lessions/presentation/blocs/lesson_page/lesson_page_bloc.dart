import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';

part 'lesson_page_event.dart';
part 'lesson_page_state.dart';

class LessonPageBloc extends Bloc<LessonPageEvent, LessonPageState> {
  final LessonGetCourseDetailUseCase _lessonGetCourseDetailUseCase;
  late final String courseId;
  late final Lesson? lesson;

  LessonPageBloc(
    this._lessonGetCourseDetailUseCase,
  ) : super(LessonPageInitialState()) {
    on<LessonPageGetCourseDetailEvent>((event, emit) async {
      final result = await _lessonGetCourseDetailUseCase(
        LessonGetCourseDetailParams(event.courseId),
      );

      emit(
        result.fold(
          (failure) => LessonPageFailedState(message: failure.message),
          (data) => LessonPageLoadedState(courseDetail: data),
        ),
      );
    });
  }

  void getCourseDetail() {
    add(LessonPageGetCourseDetailEvent(courseId: courseId));
  }
}
