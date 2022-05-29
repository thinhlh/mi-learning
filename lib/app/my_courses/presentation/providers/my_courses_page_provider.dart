import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class MyCoursesPageProvider extends LoadingProvider {
  List<MyCourse> _myCourses = [];

  List<MyCourse> get myCourses => _myCourses;

  set myCourses(List<MyCourse> value) {
    _myCourses = value;
    notifyListeners();
  }
}
