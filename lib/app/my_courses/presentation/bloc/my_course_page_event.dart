part of 'my_course_page_bloc.dart';

abstract class MyCoursePageEvent extends Equatable {
  const MyCoursePageEvent();

  @override
  List<Object> get props => [];
}

class MyCoursePageUpdateCoursesEvent extends MyCoursePageEvent {
  final List<MyCourse> myCourses;

  MyCoursePageUpdateCoursesEvent({required this.myCourses});

  @override
  List<Object> get props => [myCourses];
}
