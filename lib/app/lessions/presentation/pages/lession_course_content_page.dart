import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/common/domain/entity/section.dart';

import 'package:mi_learning/app/lessions/presentation/providers/lession_course_content_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class LessionCourseContentPage
    extends PageLoadingStateless<LessionCourseContentPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: Selector<LessionCourseContentPageProvider, List<Section>>(
        selector: (_, provider) => provider.course?.sections ?? [],
        builder: (_, sections, child) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => ExpansionTile(
            subtitle: Builder(builder: (context) {
              final totalLessons = sections[index].lessons.length;
              final currentLessonId = provider.course?.currentLesson;
              final currentLesson = sections
                  .fold<List<Lesson>>(
                    [],
                    (previousList, currentSection) =>
                        previousList..addAll(currentSection.lessons),
                  )
                  .firstWhere((lesson) => lesson.id == currentLessonId)
                  .lessonOrder;

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
                      context.read<LessionPageProvider>().lesson;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Checkbox(
                      value: Random().nextBool(),
                      onChanged: (value) {},
                    ),
                    title: Text(
                      '${lessonIndex + 1}. ${lesson.title}',
                      style: context.textTheme.bodyMedium,
                    ),
                    selected: lesson.id ==
                        context.read<LessionPageProvider>().lesson?.id,
                    selectedTileColor: AppColors.neutral.shade400,
                    subtitle: Padding(
                      padding:
                          EdgeInsets.only(top: AppDimens.mediumHeightDimens),
                      child: Row(
                        children: [
                          const Icon(Icons.play_circle),
                          SizedBox(width: AppDimens.mediumWidthDimens),
                          Text(
                            '4min',
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
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
