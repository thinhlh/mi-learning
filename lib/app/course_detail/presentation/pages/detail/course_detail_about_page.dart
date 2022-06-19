import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/course_detail/presentation/bloc/course_detail_page_bloc.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailAboutPage extends PageLoadingStateless<CourseDetailPageBloc> {
  CourseDetailAboutPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.neutral.shade50,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppDimens.largeHeightDimens),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    BlocBuilder<CourseDetailPageBloc, CourseDetailPageState>(
                      buildWhen: (previous, current) =>
                          current is CourseDetailPageInitialState ||
                          current is CourseDetailPageLoadedState,
                      builder: (context, state) {
                        final course = (state is CourseDetailPageLoadedState)
                            ? state.course
                            : null;
                        int lessons = 0;
                        final sections = course?.sections ?? [];
                        for (var section in sections) {
                          lessons += section.lessons.length;
                        }

                        var numLesson = lessons.toString();
                        return Text(
                          numLesson,
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: AppStyles.bold,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: AppDimens.smallHeightDimens),
                    Text(
                      'Lessons',
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '38,729',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: AppStyles.bold,
                      ),
                    ),
                    SizedBox(height: AppDimens.smallHeightDimens),
                    Text(
                      'Students',
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
                        int>(
                      selector: (state) =>
                          ((state is CourseDetailPageLoadedState)
                              ? state.course.length
                              : 0) ~/
                          (60 * 60),
                      builder: (context, courseLengthHour) {
                        return Text(
                          courseLengthHour.toString(),
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: AppStyles.bold,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: AppDimens.smallHeightDimens),
                    Text(
                      'Hours',
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: AppDimens.extraLargeHeightDimens,
              color: AppColors.neutral.shade500,
            ),
            Row(
              children: [
                BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
                    String>(
                  selector: (state) {
                    return (state is CourseDetailPageLoadedState)
                        ? state.course.teacher.avatar
                        : "";
                  },
                  builder: (context, teacherAvatar) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(
                        teacherAvatar,
                      ),
                    );
                  },
                ),
                SizedBox(width: AppDimens.mediumWidthDimens),
                BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
                    String>(
                  selector: (state) {
                    return (state is CourseDetailPageLoadedState)
                        ? state.course.teacher.name
                        : "";
                  },
                  builder: (context, name) {
                    return Text(
                      name,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: AppStyles.bold,
                      ),
                    );
                  },
                ),
                const Spacer(),
                StatefulBuilder(builder: (context, setState) {
                  return Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {});
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          'Follow',
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: AppStyles.bold,
                            color: Random().nextBool()
                                ? Colors.red
                                : AppColors.neutral.shade500,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Random().nextBool()
                              ? Icons.notifications_active_rounded
                              : Icons.notifications_none_outlined,
                        ),
                        onPressed: () => setState(() {}),
                      )
                    ],
                  );
                }),
              ],
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            BlocSelector<CourseDetailPageBloc, CourseDetailPageState, String>(
              selector: (state) {
                return (state is CourseDetailPageLoadedState)
                    ? state.course.description
                    : "";
              },
              builder: (context, description) {
                return ExpandableText(
                  description,
                  expandText: 'Read more',
                  style: context.textTheme.bodyMedium?.copyWith(),
                  collapseText: 'Show less',
                  maxLines: 6,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}
}
