part of 'lesson_page_bloc.dart';

abstract class LessonPageEvent extends Equatable {
  const LessonPageEvent();

  @override
  List<Object> get props => [];
}

class LessonPageGetCourseDetailEvent extends LessonPageEvent {
  final String courseId;

  LessonPageGetCourseDetailEvent({required this.courseId});
}
