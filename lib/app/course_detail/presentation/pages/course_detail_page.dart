import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/course_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailPage extends PageLoadingStateless<CourseDetailProvider> {
  late final int id;
  CourseDetailPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: AppDimens.mediumElevation,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
        ),
        title: Text(
          'Flutter course',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.neutral.shade50,
          ),
        ),
        actions: [
          StatefulBuilder(
            builder: (_, setState) => IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Random().nextBool()
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: AppColors.neutral.shade900,
              ),
            ),
          )
        ],
      ),
      body: Image.asset(
        'assets/images/flutter-course.jpeg',
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    id = context.getArgument<int>() ?? 0;
  }
}
