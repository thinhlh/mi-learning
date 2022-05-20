import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/detail/course_detail_about_page_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailAboutPage
    extends PageLoadingStateless<CourseDetailAboutPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: AppDimens.largeHeightDimens),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '12',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                  SizedBox(height: AppDimens.smallHeightDimens),
                  Text(
                    'Lessions',
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
                  Text(
                    '23',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
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
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/user-avatar-1.jpg',
                ),
              ),
              SizedBox(width: AppDimens.mediumWidthDimens),
              Text(
                'Reso Coder',
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
          ExpandableText(
            text:
                "Keeping your code clean and tested are the two most important development practices. In Flutter, this is even more true than with other frameworks. On one hand, it's nice to hack a quick app together, on the other hand, larger projects start falling apart when you mix the business logic everywhere. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase.",
            maxLines: 6,
            textStyle: context.textTheme.bodyMedium,
            showTextStyle: context.textTheme.caption?.copyWith(
              fontWeight: AppStyles.extraBold,
              color: AppColors.primarySwatch.shade500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
