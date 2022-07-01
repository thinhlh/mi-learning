import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as editor;
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/note.dart';
import 'package:mi_learning/app/lessons/domain/entities/lesson_push_detail_params.dart';
import 'package:mi_learning/app/lessons/domain/entities/note_editor_push_detail_params.dart';
import 'package:mi_learning/app/lessons/presentation/pages/lesson_course_content_page.dart';
import 'package:mi_learning/app/lessons/presentation/pages/lesson_question_answer_page.dart';
import 'package:mi_learning/app/lessons/presentation/pages/note_editor_page.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_course_content_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_note_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_question_answer_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/providers/note_editor_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/widgets/w_video_player.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/route_util.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

part 'lesson_tab_page.dart';
part 'lesson_note_page.dart';

class LessonPage extends PageLoadingStateless<LessonPageProvider> {
  LessonPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: BackButton(
            color: context.isDarkMode
                ? AppColors.neutral.shade300
                : AppColors.neutral.shade900,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                showLoading(context, true);
                await provider.getCourseDetail();
                showLoading(context, false);
              },
              icon: Icon(
                Icons.refresh,
                color: AppColors.neutral.shade900,
              ),
            ),
          ],
          title: Text(
            'Lesson',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
          ),
          centerTitle: true,
        ),
        WVideoPlayer(
          url: provider.lesson?.videoLesson?.videoUrl ?? '',
          playback: provider.lesson?.metadata.playback ?? 0,
        ),
        SizedBox(height: AppDimens.largeHeightDimens),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.mediumWidthDimens,
          ),
          child: Text(
            provider.lesson?.title ?? '',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraint) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppDimens.largeHeightDimens),
                  child: Divider(
                    color: AppColors.neutral.shade500,
                  ),
                ),
                Expanded(
                  child: Selector<LessonPageProvider, Course?>(
                    selector: (_, provider) => provider.course,
                    builder: (_, course, child) {
                      return course!.sections.isNotEmpty
                          ? _LessonTabPage(
                              course: course,
                            )
                          : Shimmer.fromColors(
                              child: _LessonTabPage(
                                course: course,
                              ),
                              baseColor: AppColors.baseShimmerColor,
                              highlightColor: AppColors.highlightShimmerColor,
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);

    final arguments = context.getArgument<LessonPushDetailParams>();

    provider.initializeData(
      arguments?.course,
      arguments?.lesson,
    );
  }
}
