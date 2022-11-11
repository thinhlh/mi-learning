import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_blur.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/course_detail_lesson_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CourseDetailLessonsPage extends StatefulWidget {
  const CourseDetailLessonsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CourseDetailLessonsPageState();
}

class _CourseDetailLessonsPageState extends PageLoadingStateful<
    CourseDetailPageProvider,
    CourseDetailLessonsPage> with SingleTickerProviderStateMixin {
  late final AnimationController lessonAnimationController;
  late final Animation<double> lessonAnimation;

  @override
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);

    lessonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..addListener(() {
        setState(() {});
      });

    lessonAnimation = CurveTween(curve: Curves.linear).animate(
      Tween<double>(
        begin: 0,
        end: context.read<CourseDetailPageProvider>().course.finishedLessons /
            context.read<CourseDetailPageProvider>().course.totalLesson,
      ).animate(lessonAnimationController),
    );

    lessonAnimationController.forward();
  }

  @override
  void dispose() {
    lessonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    final Widget lessons = SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: Column(
        children: [
          CircularProgressIndicator(
            value: lessonAnimation.value,
            strokeWidth: 6,
            backgroundColor: AppColors.neutral.shade400,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.primarySwatch.shade300,
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            '${provider.course.finishedLessons.toString() + "/" + provider.course.totalLesson.toString()} lessons',
            style: context.textTheme.titleLarge,
          ),
          Selector<CourseDetailPageProvider, List<Lesson>>(
            selector: (_, provider) {
              final lessons = provider.course.sections.fold<List<Lesson>>(
                [],
                (previousValue, element) =>
                    previousValue..addAll(element.lessons),
              );
              lessons.sort(
                (lesson1, lesson2) =>
                    lesson1.lessonOrder.compareTo(lesson2.lessonOrder),
              );

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
      child: Selector<CourseDetailPageProvider, Course>(
        selector: (_, provider) => provider.course,
        builder: (_, course, child) {
          return course.enrolled
              ? lessons
              : WBlur(
                  blur: !course.enrolled,
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
              arguments: provider.course,
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
}
