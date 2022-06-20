import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/entities/lesson_push_detail_params.dart';
import 'package:mi_learning/app/lessions/presentation/blocs/lesson_course_content_page/lesson_course_content_page_bloc.dart';
import 'package:mi_learning/app/lessions/presentation/blocs/lesson_page/lesson_page_bloc.dart';

import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class LessionCourseContentPage
    extends PageLoadingStateless<LessonCourseContentPageBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: Builder(
        builder: (_) {
          final sections = bloc.courseDetail.sections;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => ExpansionTile(
              subtitle: Builder(builder: (ctx) {
                final totalLessons = sections[index].lessons.length;
                final currentLessonId = bloc.courseDetail.currentLesson;
                late int currentLesson;
                try {
                  currentLesson = sections
                      .fold<List<CourseDetailLesson>>(
                        [],
                        (previousList, currentSection) =>
                            previousList..addAll(currentSection.lessons),
                      )
                      .firstWhere(
                          (lesson) => lesson.lessonId == currentLessonId)
                      .lessonOrder;
                } catch (e) {
                  currentLesson = 0;
                }

                final sectionLength = sections.fold<int>(
                  0,
                  (previousList, currentSection) =>
                      previousList +
                      currentSection.lessons
                          .map((e) => e.videoLesson?.length ?? 0)
                          .fold(
                              0,
                              (previousValue, element) =>
                                  previousValue + element),
                );

                return Text(
                  '$currentLesson/$totalLessons | ${Duration(minutes: sectionLength ~/ 60).inHours} hours',
                  style: context.textTheme.bodySmall,
                );
              }),
              title: Text(
                'Section ${index + 1}: ${sections[index].title}',
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: AppStyles.bold,
                ),
              ),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, lessonIndex) {
                    final lesson = sections[index].lessons[lessonIndex];
                    final currentViewingLesson =
                        context.read<LessonPageBloc>().lesson;
                    return ListTile(
                      onTap: lesson.lessonId == currentViewingLesson?.id
                          ? null
                          : () {
                              navigator.pushReplacementNamed(
                                Routes.lessons,
                                arguments: LessonPushDetailParams(
                                  lesson: Lesson.fromCourseDetailLesson(lesson),
                                  courseId: bloc.courseDetail.courseId,
                                ),
                              );
                            },
                      contentPadding: EdgeInsets.zero,
                      leading: Checkbox(
                        value: lesson.courseDetailMetaData.finished,
                        onChanged: (value) {},
                      ),
                      title: Text(
                        '${lessonIndex + 1}. ${lesson.title}',
                        style: context.textTheme.bodyMedium,
                      ),
                      selected: lesson.lessonId == currentViewingLesson?.id,
                      selectedTileColor: AppColors.neutral.shade400,
                      subtitle: Padding(
                        padding:
                            EdgeInsets.only(top: AppDimens.mediumHeightDimens),
                        child: Row(
                          children: [
                            const Icon(Icons.play_circle),
                            SizedBox(width: AppDimens.mediumWidthDimens),
                            Text(
                              lesson.videoLesson == null
                                  ? lesson.testLesson?.question ?? ""
                                  : '${Duration(seconds: lesson.videoLesson?.length ?? 0).inMinutes}min',
                              style: context.textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: sections[index].lessons.length,
                ),
              ],
            ),
            itemCount: sections.length,
          );
        },
      ),
    );
  }
}
