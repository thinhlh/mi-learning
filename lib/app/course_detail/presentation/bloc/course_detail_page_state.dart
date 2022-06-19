part of 'course_detail_page_bloc.dart';

abstract class CourseDetailPageState extends Equatable {
  const CourseDetailPageState();

  @override
  List<Object> get props => [];
}

class CourseDetailPageInitialState extends CourseDetailPageState {}

class CourseDetailPageLoadingState extends CourseDetailPageState {}

class CourseDetailPageLoadedState extends CourseDetailPageState {
  final Course course;

  CourseDetailPageLoadedState({required this.course});
}

class CourseDetailPageFailedState extends CourseDetailPageState {
  final String message;

  CourseDetailPageFailedState({required this.message});
}
