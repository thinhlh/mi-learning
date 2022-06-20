import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';

part 'lesson_note_page_event.dart';
part 'lesson_note_page_state.dart';

class LessonNotePageBloc
    extends Bloc<LessonNotePageEvent, LessonNotePageState> {
  final CourseDetail courseDetail;

  LessonNotePageBloc({required this.courseDetail})
      : super(LessonNotePageInitial()) {
    on<LessonNotePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
