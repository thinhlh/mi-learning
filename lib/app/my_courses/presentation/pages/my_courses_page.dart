import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/my_course_widget.dart';
import 'package:mi_learning/app/my_courses/presentation/bloc/my_course_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class MyCoursePage extends PageLoadingStateless<MyCoursePageBloc> {
  MyCoursePage({Key? key}) : super(key: key);

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
      body: BlocSelector<MyCoursePageBloc, MyCoursePageState, List<MyCourse>>(
        selector: (state) => state.myCourses,
        builder: (_, myCourses) => myCourses.isEmpty
            ? Center(
                child: Text(
                  'You have not joined any course!',
                  style: context.textTheme.titleLarge,
                ),
              )
            : ListView.separated(
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
    bloc.updateMyCourses(context.getArgument<List<MyCourse>>() ?? []);
  }
}
