import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionPageProvider extends LoadingProvider {
  Course? course;
  Lesson? lesson;
}
