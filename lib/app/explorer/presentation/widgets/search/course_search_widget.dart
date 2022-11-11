import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class CourseSearchWidget extends StatelessWidget {
  final Course course;
  const CourseSearchWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.neutral.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.mediumRadius,
        ),
      ),
      child: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
