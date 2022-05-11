import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_editor_choice_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ExplorerEditorChoicePage
    extends PageLoadingStateless<ExplorerEditorChoiceProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
      ),
      child: Column(
        children: [
          Visibility(
            visible: true,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Tutors\' Choice',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: AppStyles.extraBold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A roating selection of the best courses, handpicked by the Mi Learning tutors.',
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: AppStyles.normal,
                            ),
                          ),
                          SizedBox(height: AppDimens.largeHeightDimens),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'OK',
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.primarySwatch.shade500,
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/pngwing.com.png',
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Editors\' Choice Courses',
                style: context.textTheme.titleLarge,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          SizedBox(
            height: 0.35.sh,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(right: AppDimens.largeWidthDimens),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppDimens.largeRadius,
                        ),
                        child: Image.asset(
                          'assets/images/flutter-course.jpeg',
                          fit: BoxFit.cover,
                          width: 0.8.sw,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Row(
                      children: [
                        Container(
                          width: 70.w,
                          height: 70.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDimens.largeRadius),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/user-avatar-1.jpg',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimens.largeWidthDimens),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter Crash Course',
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                            Text(
                              'Flutter • Beginner • Mobile',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              '4.8 ★ - 24 hours',
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
