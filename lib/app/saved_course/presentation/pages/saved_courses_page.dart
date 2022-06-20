import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_medium_widget.dart';
import 'package:mi_learning/app/saved_course/presentation/providers/saved_courses_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class SavedCoursesPage extends PageLoadingStateless<SavedCoursesPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved courses',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
      ),
      body: Selector<SavedCoursesPageProvider, List<Course>>(
        selector: (_, provider) => provider.savedCourses,
        builder: (_, courses, child) => courses.isEmpty
            ? Center(
                child: Text(
                  'You don\'t have any saved course. Browse now.',
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                separatorBuilder: (_, index) =>
                    SizedBox(height: AppDimens.largeHeightDimens),
                itemBuilder: (_, index) => Center(
                  child: CourseMediumWidget(
                    course: courses[index],
                  ),
                ),
                itemCount: courses.length,
              ),
      ),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    showLoading(context, true);
    provider.getSavedCourses().then((value) => showLoading(context, false));
  }
}
