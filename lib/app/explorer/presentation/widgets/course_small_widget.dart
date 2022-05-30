import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseSmallWidget extends StatelessWidget {
  final Course course;
  const CourseSmallWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.25.sh,
      width: 0.7.sw,
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
                child: Image.network(
                  course.background,
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
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(course.teacher.avatar),
                    ),
                  ),
                ),
                SizedBox(width: AppDimens.largeWidthDimens),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: AppStyles.bold,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        course.category,
                        style: context.textTheme.bodySmall,
                      ),
                      Text(
                        '${course.courseRatings.average} ★ - ${Duration(seconds: course.length).inHours} hours',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
