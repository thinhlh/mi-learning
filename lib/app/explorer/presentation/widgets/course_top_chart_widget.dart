import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseTopChartWidget extends StatelessWidget {
  final int index;
  final Course course;
  const CourseTopChartWidget({
    Key? key,
    required this.index,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppDimens.extraLargeHeightDimens),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Text(
              (index + 1).toString(),
              style: context.textTheme.titleMedium,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(
                      AppDimens.largeRadius,
                    ),
                    elevation: AppDimens.smallElevation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppDimens.largeRadius,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          course.background,
                          fit: BoxFit.cover,
                          width: 0.25.sw,
                          height: 0.25.sw,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimens.largeWidthDimens),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: context.textTheme.titleSmall,
                          maxLines: 2,
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Text(
                          course.teacher.name,
                          style: context.textTheme.bodySmall,
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Container(
                          color: AppColors.info.withOpacity(0.7),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.smallWidthDimens,
                            vertical: AppDimens.smallHeightDimens,
                          ),
                          child: Text(
                            course.category,
                            style: context.textTheme.subtitle2?.copyWith(
                              fontWeight: AppStyles.extraLight,
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Row(
                          children: [
                            Text(
                              '\$${NumberFormat.currency(symbol: ' ').format(course.price)}',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                            SizedBox(width: AppDimens.mediumWidthDimens),
                            Text(
                              '${course.courseRatings.average.toStringAsFixed(1)} ★',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
