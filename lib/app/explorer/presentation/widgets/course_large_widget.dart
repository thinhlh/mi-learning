import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseLargeWidget extends StatelessWidget {
  const CourseLargeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.largeRadius),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.neutral.shade500,
          ),
          borderRadius: BorderRadius.circular(AppDimens.largeRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/flutter-course.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(AppDimens.largeWidthDimens),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter Crash Course with TDD • Ends in 1 days',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: AppStyles.extraLight),
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  Text(
                    'Heads up to Flutter course with TDD development process as a professional',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppStyles.normal,
                    ),
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  Text(
                    'Enroll',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.primarySwatch.shade500,
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
