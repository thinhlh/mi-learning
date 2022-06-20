import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';

class LessonPushDetailParams {
  final Lesson lesson;
  final Course course;

  LessonPushDetailParams({
    required this.lesson,
    required this.course,
  });
}
