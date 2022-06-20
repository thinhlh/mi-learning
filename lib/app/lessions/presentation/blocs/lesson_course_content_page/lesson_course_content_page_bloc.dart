import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';

part 'lesson_course_content_page_event.dart';
part 'lesson_course_content_page_state.dart';

class LessonCourseContentPageBloc
    extends Bloc<LessonCourseContentPageEvent, LessonCourseContentPageState> {
  final CourseDetail courseDetail;

  LessonCourseContentPageBloc({required this.courseDetail})
      : super(LessonCourseContentPageInitial()) {
    on<LessonCourseContentPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
