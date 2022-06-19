import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/lessions/domain/entities/lesson_push_detail_params.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailLessonWidget extends StatelessWidget {
  final Lesson lesson;
  final int order;
  final String courseId;
  const CourseDetailLessonWidget({
    Key? key,
    required this.lesson,
    required this.order,
    required this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.navigator.pushNamed(
        Routes.lessons,
        arguments: LessonPushDetailParams(
          lesson: lesson,
          courseId: courseId,
        ),
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              (order + 1).toString().padLeft(3, '0'),
              style: context.textTheme.titleLarge?.copyWith(
                color: AppColors.neutral.shade400,
              ),
              maxLines: 2,
              softWrap: true,
            ),
          ),
        ],
      ),
      title: Text(
        lesson.title,
        style: context.textTheme.titleSmall?.copyWith(
          fontWeight: AppStyles.bold,
        ),
      ),
      subtitle: Text(
        DateTimeHelper.formatDuration(
          Duration(seconds: lesson.videoLesson?.length ?? 0),
        ),
        style: context.textTheme.bodySmall?.copyWith(),
      ),
      trailing: CircleAvatar(
        backgroundColor: AppColors.success,
        child: Icon(
          Icons.play_arrow,
          color: AppColors.neutral.shade50,
        ),
      ),
    );
  }
}
