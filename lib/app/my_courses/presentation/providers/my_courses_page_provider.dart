import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class MyCoursesPageProvider extends LoadingProvider {
  List<Course> _myCourses = [];

  List<Course> get myCourses => _myCourses;

  set myCourses(List<Course> value) {
    _myCourses = value;
    notifyListeners();
  }

  void setMyCourseWithoutNotifyListener(List<Course> course) {
    _myCourses = course;
  }
}
