part of 'saved_course_page_bloc.dart';

abstract class SavedCoursePageEvent extends Equatable {
  const SavedCoursePageEvent();

  @override
  List<Object> get props => [];
}

class SavedCoursePageGetCoursesEvent extends SavedCoursePageEvent {}
