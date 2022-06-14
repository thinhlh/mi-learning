import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionCourseContentPageProvider extends LoadingProvider {
  late CourseDetail _courseDetail;
  CourseDetail get courseDetail => _courseDetail;
  LessionCourseContentPageProvider({required CourseDetail course}) {
    _courseDetail = course;
  }

  List<CourseDetailSection> get courseDetailSection => _courseDetail.sections;
}
