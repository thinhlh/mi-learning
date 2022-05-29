import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionCourseContentPageProvider extends LoadingProvider {
  final Course? course;
  LessionCourseContentPageProvider({required this.course});
}
