import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';

part 'my_course_page_event.dart';
part 'my_course_page_state.dart';

class MyCoursePageBloc extends Bloc<MyCoursePageEvent, MyCoursePageState> {
  MyCoursePageBloc() : super(const MyCoursePageState(myCourses: [])) {
    on<MyCoursePageUpdateCoursesEvent>((event, emit) {
      emit(MyCoursePageState(myCourses: event.myCourses));
    });
  }

  void updateMyCourses(List<MyCourse> courses) {
    add(MyCoursePageUpdateCoursesEvent(myCourses: courses));
  }
}
