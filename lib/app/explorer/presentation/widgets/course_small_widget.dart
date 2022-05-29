import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseSmallWidget extends StatelessWidget {
  const CourseSmallWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.25.sh,
      child: Padding(
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
                  width: 0.6.sw,
                ),
              ),
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.largeRadius),
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
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: AppStyles.bold,
                      ),
                    ),
                    Text(
                      'Flutter • Beginner • Mobile',
                      style: context.textTheme.bodySmall,
                    ),
                    Text(
                      '4.8 ★ - 24 hours',
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
