import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class MyCourseWidget extends StatelessWidget {
  final Course myCourse;
  const MyCourseWidget({
    Key? key,
    required this.myCourse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(
        Routes.courseDetail,
        arguments: myCourse,
      ),
      child: Container(
        height: 0.16.sh,
        padding: EdgeInsets.all(
          AppDimens.largeWidthDimens,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDimens.mediumRadius,
          ),
          // border: Border.all(color: AppColors.neutral.shade500),
          color: AppColors.neutral.shade50,
        ),
        width: 0.8.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppDimens.smallRadius,
                  ),
                  child: Image.network(
                    (myCourse.icon == null || (myCourse.icon?.isEmpty ?? true))
                        ? myCourse.background
                        : myCourse.icon!,
                    fit: BoxFit.cover,
                    height: 60.r,
                    width: 60.r,
                  ),
                ),
                SizedBox(width: AppDimens.mediumWidthDimens),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        myCourse.title,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: AppStyles.extraBold,
                        ),
                      ),
                      SizedBox(height: AppDimens.mediumHeightDimens),
                      Text(
                        myCourse.currentLessonTitle ?? "Try learn this course!",
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleSmall?.copyWith(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${myCourse.finishedLessons} lessons',
                  style: context.textTheme.subtitle2?.copyWith(
                    color: AppColors.primarySwatch.shade500,
                    fontWeight: AppStyles.bold,
                  ),
                ),
                Text(
                  '${myCourse.totalLesson} lessons',
                  style: context.textTheme.subtitle2,
                ),
              ],
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Expanded(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.neutral.shade300,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(AppDimens.extraLargeHeightDimens),
                      right: Radius.circular(AppDimens.extraLargeHeightDimens),
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                      width: constraint.maxWidth *
                          myCourse.finishedLessons /
                          (myCourse.totalLesson == 0
                              ? 1
                              : myCourse.totalLesson),
                      decoration: BoxDecoration(
                        color: AppColors.primarySwatch.shade100,
                        borderRadius: BorderRadius.horizontal(
                          left:
                              Radius.circular(AppDimens.extraLargeHeightDimens),
                          right:
                              Radius.circular(AppDimens.extraLargeHeightDimens),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
