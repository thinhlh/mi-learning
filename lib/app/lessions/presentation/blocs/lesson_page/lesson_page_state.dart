part of 'lesson_page_bloc.dart';

abstract class LessonPageState extends Equatable {
  const LessonPageState();

  @override
  List<Object> get props => [];
}

class LessonPageInitialState extends LessonPageState {}

class LessonPageLoadingState extends LessonPageState {}

class LessonPageLoadedState extends LessonPageState {
  final CourseDetail courseDetail;

  LessonPageLoadedState({required this.courseDetail});
}

class LessonPageFailedState extends LessonPageState {
  final String message;

  LessonPageFailedState({required this.message});
}
