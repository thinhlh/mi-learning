import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CourseDetailAboutPage
    extends PageLoadingStateless<CourseDetailPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Consumer<CourseDetailPageProvider>(
      builder: (_, provider, child) => Container(
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
                      Builder(
                        builder: (context) {
                          int lessons = 0;
                          final sections = provider.course.sections;
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
                        tr(LocaleKeys.pages_course_detail_tabs_about_lessons),
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
                        tr(LocaleKeys.pages_course_detail_tabs_about_students),
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        ((provider.course.length) ~/ (60 * 60)).toString(),
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: AppStyles.bold,
                        ),
                      ),
                      SizedBox(height: AppDimens.smallHeightDimens),
                      Text(
                        tr(LocaleKeys.pages_course_detail_tabs_about_hours),
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
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      provider.course.teacher.avatar,
                    ),
                  ),
                  SizedBox(width: AppDimens.mediumWidthDimens),
                  Text(
                    provider.course.teacher.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
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
                            tr(LocaleKeys
                                .pages_course_detail_tabs_about_follow),
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
              ExpandableText(
                provider.course.description,
                expandText:
                    tr(LocaleKeys.pages_course_detail_tabs_about_read_more),
                style: context.textTheme.bodyMedium?.copyWith(),
                collapseText:
                    tr(LocaleKeys.pages_course_detail_tabs_about_show_less),
                maxLines: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
