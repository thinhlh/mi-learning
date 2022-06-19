part of 'saved_course_page_bloc.dart';

abstract class SavedCoursePageState extends Equatable {
  const SavedCoursePageState();

  @override
  List<Object> get props => [];
}

class SavedCoursePageInitialState extends SavedCoursePageState {}

class SavedCoursePageLoadingState extends SavedCoursePageState {}

class SavedCoursePageFailedState extends SavedCoursePageState {
  final String message;

  SavedCoursePageFailedState({required this.message});
}

class SavedCoursePageLoadedState extends SavedCoursePageState {
  final List<Course> courses;

  SavedCoursePageLoadedState({required this.courses});
}
