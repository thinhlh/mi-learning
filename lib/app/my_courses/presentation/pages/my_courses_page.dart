import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/my_course_widget.dart';
import 'package:mi_learning/app/my_courses/presentation/providers/my_courses_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class MyCoursePage extends PageLoadingStateless<MyCoursesPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral.shade300,
      appBar: AppBar(
        backgroundColor: AppColors.neutral.shade300,
        title: Text(
          'My Courses',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
      ),
      body: provider.myCourses.isEmpty
          ? Center(
              child: Text(
                'You have not joined any course!',
                style: context.textTheme.titleLarge,
              ),
            )
          : Selector<MyCoursesPageProvider, List<Course>>(
              selector: (_, provider) => provider.myCourses,
              builder: (_, myCourses, child) => ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                separatorBuilder: (_, index) => SizedBox(
                  height: AppDimens.largeHeightDimens,
                ),
                itemBuilder: (_, index) => Card(
                  child: MyCourseWidget(
                    myCourse: myCourses[index],
                  ),
                ),
                itemCount: myCourses.length,
              ),
            ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);
    provider.setMyCourseWithoutNotifyListener(
        context.getArgument<List<Course>>() ?? []);
  }
}
