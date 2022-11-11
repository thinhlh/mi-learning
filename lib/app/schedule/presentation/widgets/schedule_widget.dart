import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule_color.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'dart:math';

import 'package:mi_learning/utils/extensions/string_extension.dart';

class ScheduleWidget extends StatelessWidget {
  final Schedule schedule;

  ScheduleWidget({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(
        Routes.scheduleDetail,
        arguments: schedule,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppDimens.mediumWidthDimens,
          vertical: AppDimens.mediumHeightDimens,
        ),
        decoration: BoxDecoration(
          color: schedule.color.color,
          borderRadius: BorderRadius.circular(
            AppDimens.largeRadius,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Positioned.fill(
                      child: Transform.rotate(
                        angle: pi / 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimens.largeRadius,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondaryLight.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(
                          AppDimens.largeRadius,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.largeHeightDimens,
                        horizontal: AppDimens.largeWidthDimens,
                      ),
                      child: Column(
                        children: [
                          Text(
                            DateFormat.MMM()
                                .format(schedule.dueDate)
                                .toUpperCase(),
                            style: TextStyle(
                              color: AppColors.neutral.shade100,
                            ),
                          ),
                          Text(
                            DateFormat.d()
                                .format(schedule.dueDate)
                                .toUpperCase(),
                            style: TextStyle(
                              fontWeight: AppStyles.extraBold,
                              color: AppColors.neutral.shade50,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: AppDimens.largeWidthDimens),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeHelper.format(
                            schedule.dueDate,
                            format: DateFormat('E HH:mm a'),
                          ) +
                          ' | ${schedule.location.toCamelCase()}',
                      style: TextStyle(
                        color: AppColors.neutral.shade900,
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.largeWidthDimens,
                        vertical: AppDimens.mediumHeightDimens,
                      ),
                      decoration: const ShapeDecoration(
                        color: Colors.black12,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        schedule.status.name.toCamelCase(),
                        style: TextStyle(
                          color: AppColors.neutral.shade50,
                          fontWeight: AppStyles.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Text(
              schedule.title,
              style: context.textTheme.titleLarge?.copyWith(
                color: AppColors.neutral.shade50,
                fontWeight: AppStyles.extraBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
