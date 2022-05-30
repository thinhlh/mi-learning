import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';

class LessonPushDetailParams {
  final Lesson lesson;
  final String courseId;

  LessonPushDetailParams({
    required this.lesson,
    required this.courseId,
  });
}
