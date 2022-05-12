import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_course_content_provider.dart';
import 'package:mi_learning/app/lessions/presentation/widgets/custom_expansion_tile.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class LessionCourseContentPage
    extends PageLoadingStateless<LessionCourseContentProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: ListView.builder(
        itemBuilder: (_, index) => ExpansionTile(
          subtitle: Text(
            '12/14 | 55 min',
            style: context.textTheme.bodySmall,
          ),
          title: Text(
            'Section ${index + 1}: Getting Started with iOS Development and Swift 5',
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: AppStyles.bold,
            ),
          ),
          children: [
            for (int i = 0; i < 100; i++)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                  value: Random().nextBool(),
                  onChanged: (value) {},
                ),
                title: Text(
                  '${i + 1}. Intro to the course. What\'s coming up?',
                  style: context.textTheme.bodyMedium,
                ),
                selected: i == 0,
                selectedTileColor: AppColors.neutral.shade400,
                subtitle: Padding(
                  padding: EdgeInsets.only(top: AppDimens.mediumHeightDimens),
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
              ),
          ],
        ),
        itemCount: 100,
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
