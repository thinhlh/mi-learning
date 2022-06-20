import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/section.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionCourseContentPageProvider extends LoadingProvider {
  late Course _course;
  Course get course => _course;
  LessionCourseContentPageProvider({required Course course}) {
    _course = course;
  }

  List<Section> get sections => _course.sections;
}
