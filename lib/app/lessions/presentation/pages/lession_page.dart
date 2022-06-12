import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as editor;
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/entities/lesson_push_detail_params.dart';
import 'package:mi_learning/app/lessions/presentation/pages/lession_question_answer_page.dart';
import 'package:mi_learning/app/lessions/presentation/pages/note_editor_page.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_course_content_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/pages/lession_course_content_page.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_note_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_question_answer_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/providers/note_editor_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/widgets/w_video_player.dart';
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

part 'lession_tab_page.dart';
part 'lession_note_page.dart';

class LessionPage extends PageLoadingStateless<LessionPageProvider> {
  LessionPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        AppBar(
          leading: BackButton(
            color: context.isDarkMode
                ? AppColors.neutral.shade300
                : AppColors.neutral.shade900,
          ),
          title: Text(
            'Lesson',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
          ),
          centerTitle: true,
        ),
        WVideoPlayer(url: provider.lesson?.videoLesson?.videoUrl ?? ''),
        SizedBox(height: AppDimens.largeHeightDimens),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppDimens.mediumWidthDimens),
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
                  child: Selector<LessionPageProvider, CourseDetail>(
                    selector: (_, provider) => provider.courseDetail,
                    builder: (_, courseDetail, child) {
                      return courseDetail.sections.isNotEmpty
                          ? _LessionTabPage(
                              courseDetail: courseDetail,
                              safePadding: safePadding,
                            )
                          : Shimmer.fromColors(
                              child: _LessionTabPage(
                                courseDetail: courseDetail,
                                safePadding: safePadding,
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
  void initialization(BuildContext context) {
    final arguments = context.getArgument<LessonPushDetailParams>();
    provider.courseId = arguments?.courseId;
    provider.lesson = arguments?.lesson;
    provider.getCourseDetail();
  }
}
