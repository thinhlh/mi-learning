part of 'course_detail_page_bloc.dart';

abstract class CourseDetailPageEvent extends Equatable {
  const CourseDetailPageEvent();

  @override
  List<Object> get props => [];
}

class CourseDetailPageToggleSaveCourseEvent extends CourseDetailPageEvent {
  final String courseId;

  CourseDetailPageToggleSaveCourseEvent({required this.courseId});
}

class CourseDetailPageGetCourseDetailEvent extends CourseDetailPageEvent {
  final String courseId;

  CourseDetailPageGetCourseDetailEvent({required this.courseId});
}

class CourseDetailPageReloadCourseEvent extends CourseDetailPageEvent {
  final Course course;

  CourseDetailPageReloadCourseEvent({required this.course});
}
