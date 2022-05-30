import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionCourseContentPageProvider extends LoadingProvider {
  final CourseDetail? courseDetail;
  LessionCourseContentPageProvider({required this.courseDetail});
}
