import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/course_detail/presentation/bloc/course_detail_page_bloc.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_about_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_discuss_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_lessions_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_ratings_page.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailPage extends PageLoadingStateless<CourseDetailPageBloc> {
  late final String id;
  CourseDetailPage({Key? key}) : super(key: key);
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade100,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.r),
          ),
          color: AppColors.neutral.shade50,
        ),
        margin: EdgeInsets.symmetric(horizontal: AppDimens.mediumWidthDimens),
        padding: EdgeInsets.all(AppDimens.largeWidthDimens),
        child: Column(
          children: [
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.centerLeft,
              child: BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
                  String>(
                selector: (state) => (state is CourseDetailPageLoadedState)
                    ? state.course.title
                    : "",
                builder: (context, title) {
                  return Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: AppStyles.extraBold,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.centerLeft,
              child: BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
                  String>(
                selector: (state) => (state is CourseDetailPageLoadedState)
                    ? state.course.teacher.name
                    : "",
                builder: (context, teacherName) {
                  return Text(
                    'by $teacherName}',
                    style: context.textTheme.caption?.copyWith(
                      fontSize: context.textTheme.subtitle2?.fontSize,
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: AppDimens.largeHeightDimens,
              ),
              width: double.infinity,
              child: BlocBuilder<CourseDetailPageBloc, CourseDetailPageState>(
                buildWhen: (previous, current) =>
                    current is CourseDetailPageLoadedState ||
                    current is CourseDetailPageInitialState,
                builder: (context, state) {
                  final course = (state is CourseDetailPageLoadedState)
                      ? state.course
                      : null;
                  return (course?.enrolled ?? false)
                      ? const SizedBox.shrink()
                      : ElevatedButton(
                          onPressed: course == null
                              ? null
                              : () => navigator
                                      .pushNamed(
                                    Routes.orderDetail,
                                    arguments: course,
                                  )
                                      .then(
                                    (value) {
                                      if (value == true) {
                                        bloc.reloadCourse(
                                            course.copyWith(enrolled: true));
                                        navigator.pop();
                                      }
                                    },
                                  ),
                          child: const Text(
                            'ENROLL',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.mediumRadius,
                                ),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(
                              AppDimens.mediumElevation,
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                vertical: 12.h,
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                ),
                child: BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
                    String>(
                  selector: (state) {
                    return (state is CourseDetailPageLoadedState)
                        ? state.course.background
                        : "";
                  },
                  builder: (context, background) {
                    return Image.network(
                      background,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Text(
                          'Unable to load image!',
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    );
                  },
                ),
                elevation: AppDimens.largeElevation,
                clipBehavior: Clip.hardEdge,
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            const Expanded(child: _CouseDetailTab())
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primarySwatch.shade100,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: context.isDarkMode
              ? AppColors.neutral.shade50
              : AppColors.neutral.shade900,
        ),
        onPressed: () => navigator.pop(),
      ),
      title: Text(
        'Course Detail',
        style: context.textTheme.titleLarge?.copyWith(),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            bloc.toggleSaveCourse(id);
          },
          icon: BlocConsumer<CourseDetailPageBloc, CourseDetailPageState>(
            listener: (context, state) {
              if (state is CourseDetailPageInitialState) {
              } else if (state is CourseDetailPageLoadingState) {
                showLoading(context, true);
              } else if (state is CourseDetailPageLoadedState) {
                showLoading(context, false);
              } else if (state is CourseDetailPageFailedState) {
                showLoading(context, false);
                showDialog(
                  context: context,
                  builder: (_) => WDialog(
                    dialogType: DialogType.error,
                    content: state.message,
                    onActions: const [],
                  ),
                );
              }
            },
            buildWhen: (previous, current) =>
                current is CourseDetailPageLoadedState ||
                current is CourseDetailPageInitialState,
            builder: (context, state) {
              return Icon(
                ((state is CourseDetailPageLoadedState)
                        ? state.course.saved
                        : false)
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: AppColors.neutral.shade900,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void beforeBuild(BuildContext context) {
    id = context.getArgument<String>() ?? "";
  }

  @override
  void afterFirstBuild(BuildContext context) async {
    super.afterFirstBuild(context);
    bloc.getCourseDetail(id);
  }
}

class _CouseDetailTab extends StatefulWidget {
  const _CouseDetailTab({Key? key}) : super(key: key);

  @override
  State<_CouseDetailTab> createState() => _CouseDetailTabState();
}

class _CouseDetailTabState
    extends PageLoadingStateful<CourseDetailPageBloc, _CouseDetailTab>
    with TickerProviderStateMixin {
  late final TabController tabController;
  late final AnimationController lessionAnimationController;
  late final Animation<double> lessionAnimation;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          if (tabController.index == 1) {
            lessionAnimationController.forward();
          } else {
            lessionAnimationController.reset();
          }
        }
      });

    lessionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..addListener(() {
        setState(() {});
      });

    lessionAnimation = CurveTween(curve: Curves.easeInOutCubic).animate(
      Tween<double>(begin: 0, end: 0.8).animate(lessionAnimationController),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    lessionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.neutral.shade50,
          toolbarHeight: 0,
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            labelStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
            unselectedLabelStyle: context.textTheme.titleMedium,
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.zero,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Lession'),
              Tab(text: 'Discuss'),
              Tab(text: 'Ratings'),
            ],
            controller: tabController,
          ),
        ),
        body: BlocBuilder<CourseDetailPageBloc, CourseDetailPageState>(
          buildWhen: (previous, current) =>
              current is CourseDetailPageLoadedState ||
              current is CourseDetailPageInitialState,
          builder: (_, state) => TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            children: [
              CourseDetailAboutPage(),
              CourseDetailLessionsPage(lessionAnimation: lessionAnimation),
              CourseDetailDiscussPage(),
              CourseDetailRatingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
