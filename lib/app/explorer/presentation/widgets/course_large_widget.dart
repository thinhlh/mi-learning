import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseLargeWidget extends StatelessWidget {
  final Course course;
  const CourseLargeWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(
        Routes.courseDetail,
        arguments: course,
      ),
      child: ClipRRect(
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
              Image.network(
                course.background,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.all(AppDimens.largeWidthDimens),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: AppStyles.bold,
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Text(
                      course.description,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: AppStyles.extraLight,
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Text(
                      course.teacher.name,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: AppStyles.normal,
                      ),
                      maxLines: 4,
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
      ),
    );
  }
}
