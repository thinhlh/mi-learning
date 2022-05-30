import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_blur.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/course_detail_lesson_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CourseDetailLessionsPage
    extends PageLoadingStateless<CourseDetailPageProvider> {
  final Animation<double> lessionAnimation;

  CourseDetailLessionsPage({
    Key? key,
    required this.lessionAnimation,
  }) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    final Widget lessons = SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: Column(
        children: [
          // AnimatedContainer(
          //   duration: Duration.zero,
          //   child: CircularProgressIndicator(
          //     value: lessionAnimation.value,
          //     strokeWidth: 6,
          //     backgroundColor: AppColors.neutral.shade400,
          //     valueColor: AlwaysStoppedAnimation<Color>(
          //       AppColors.primarySwatch.shade300,
          //     ),
          //   ),
          // ),
          // SizedBox(height: AppDimens.mediumHeightDimens),
          // Text(
          //   '80/100 lessions',
          //   style: context.textTheme.titleLarge,
          // ),
          Selector<CourseDetailPageProvider, List<Lesson>>(
            selector: (_, provider) {
              final sections = provider.course?.sections ?? [];
              final lessons = <Lesson>[];

              for (var element in sections) {
                lessons.addAll(element.lessons);
              }

              return lessons;
            },
            builder: (_, lessons, child) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: AppDimens.largeHeightDimens),
              shrinkWrap: true,
              itemBuilder: (_, index) => CourseDetailLessonWidget(
                order: index,
                lesson: lessons[index],
              ),
              itemCount: lessons.length,
            ),
          ),
        ],
      ),
    );

    return Container(
      color: AppColors.neutral.shade50,
      child: Selector<CourseDetailPageProvider, bool>(
        selector: (_, provider) => provider.course?.enrolled ?? false,
        builder: (_, enrolled, child) {
          return enrolled
              ? lessons
              : WBlur(
                  blur: !enrolled,
                  overlayChild: _blurOverlay(context),
                  child: lessons,
                );
        },
      ),
    );
  }

  Column _blurOverlay(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.lock,
          size: AppDimens.largeIcon,
        ),
        SizedBox(height: AppDimens.mediumHeightDimens),
        ElevatedButton(
          onPressed: () {
            navigator
                .pushNamed(
              Routes.orderDetail,
              arguments: provider.course!,
            )
                .then(
              (value) {
                if (value == true) {
                  navigator.pop();
                }
              },
            );
          },
          child: Text(
            'Enroll in this course',
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.neutral.shade50,
              fontWeight: AppStyles.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColors.tetiary,
            ),
            elevation: MaterialStateProperty.all(AppDimens.mediumElevation),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: AppDimens.largeWidthDimens,
                vertical: AppDimens.largeHeightDimens,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initialization(BuildContext context) {}
}
