import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_medium_widget.dart';
import 'package:mi_learning/app/saved_course/presentation/bloc/saved_course_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class SavedCoursesPage extends PageLoadingStateless<SavedCoursePageBloc> {
  SavedCoursesPage({Key? key}) : super(key: key);

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
      body: BlocConsumer<SavedCoursePageBloc, SavedCoursePageState>(
          listener: (_, state) {
            if (state is SavedCoursePageLoadingState) {
              showLoading(context, true);
            } else {
              showLoading(context, false);
              if (state is SavedCoursePageFailedState) {
                showDialog(
                  context: context,
                  builder: (_) => WDialog(
                    dialogType: DialogType.error,
                    content: state.message,
                    onActions: [],
                  ),
                );
              }
            }
          },
          listenWhen: (_, state) =>
              state is SavedCoursePageLoadingState ||
              state is SavedCoursePageFailedState,
          buildWhen: (_, state) =>
              state is SavedCoursePageInitialState ||
              state is SavedCoursePageLoadedState,
          builder: (_, state) {
            final courses = state is SavedCoursePageInitialState
                ? []
                : (state as SavedCoursePageLoadedState).courses;

            return courses.isEmpty
                ? Center(
                    child: Text(
                      'You don\'t have any saved course. Browse now.',
                      style: context.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (_, index) => SizedBox(
                      height: AppDimens.largeHeightDimens,
                    ),
                    itemBuilder: (_, index) => Center(
                      child: CourseMediumWidget(
                        course: courses[index],
                      ),
                    ),
                    itemCount: courses.length,
                  );
          }),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.getSavedCourses();
  }
}
