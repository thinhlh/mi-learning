import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lesson_question_answer_page_event.dart';
part 'lesson_question_answer_page_state.dart';

class LessonQuestionAnswerPageBloc extends Bloc<LessonQuestionAnswerPageEvent, LessonQuestionAnswerPageState> {
  LessonQuestionAnswerPageBloc() : super(LessonQuestionAnswerPageInitial()) {
    on<LessonQuestionAnswerPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
