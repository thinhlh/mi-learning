import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/section.dart';
import 'package:mi_learning/app/lessons/domain/entities/lesson_push_detail_params.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_finished_status_use_case.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_course_content_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class LessonCourseContentPage
    extends PageLoadingStateless<LessonCourseContentPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: Selector<LessonCourseContentPageProvider, List<Section>>(
        selector: (_, provider) {
          final section = provider.sections;
          section.sort(
            (section1, section2) =>
                section1.lessons.first.lessonOrder.compareTo(
              section2.lessons.first.lessonOrder,
            ),
          );
          return section;
        },
        builder: (_, sections, child) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => ExpansionTile(
            subtitle: Builder(builder: (ctx) {
              final totalLessons = sections[index].lessons.length;
              final viewedLesson = sections[index]
                  .lessons
                  .where((element) => element.metadata.finished)
                  .length;

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
                '$viewedLesson/$totalLessons | ${Duration(minutes: sectionLength ~/ 60).inHours} hours',
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
                      context.read<LessonPageProvider>().lesson;
                  return ListTile(
                    onTap: lesson.id == currentViewingLesson?.id
                        ? null
                        : () {
                            navigator.pushReplacementNamed(
                              Routes.lessons,
                              arguments: LessonPushDetailParams(
                                lesson: lesson,
                                course: provider.course,
                              ),
                            );
                          },
                    contentPadding: EdgeInsets.zero,
                    leading: StatefulBuilder(builder: (_, setStateCheckBox) {
                      return Checkbox(
                        value: sections[index]
                            .lessons[lessonIndex]
                            .metadata
                            .finished,
                        onChanged: (value) async {
                          await provider.updateLessonStatus(
                            UpdateLessonFinishedStatusParams(
                              lessonId: lesson.id,
                              finished: value ?? false,
                            ),
                          );

                          setStateCheckBox(
                            () {
                              sections[index].lessons[lessonIndex] =
                                  sections[index].lessons[lessonIndex].copyWith(
                                        metadata: lesson.metadata.copyWith(
                                          finished: value,
                                        ),
                                      );
                            },
                          );
                        },
                      );
                    }),
                    title: Text(
                      '${lessonIndex + 1}. ${lesson.title}',
                      style: context.textTheme.bodyMedium,
                    ),
                    selected: lesson.id == currentViewingLesson?.id,
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
        ),
      ),
    );
  }
}
