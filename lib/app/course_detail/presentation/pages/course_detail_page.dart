import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_about_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_discuss_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_lessions_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_ratings_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/route_util.dart';
import 'package:provider/provider.dart';

class CourseDetailPage extends PageLoadingStateless<CourseDetailPageProvider> {
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
              child: Text(
                context.select<CourseDetailPageProvider, String>(
                  (provider) => provider.course?.title ?? "",
                ),
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.extraBold,
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'by ${context.select<CourseDetailPageProvider, String>((provider) => provider.course?.teacher.name ?? "")}',
                style: context.textTheme.caption?.copyWith(
                  fontSize: context.textTheme.subtitle2?.fontSize,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: AppDimens.largeHeightDimens,
              ),
              width: double.infinity,
              child: context.select<CourseDetailPageProvider, bool>(
                (provider) => provider.course?.enrolled ?? false,
              )
                  ? const SizedBox.shrink()
                  : ElevatedButton(
                      onPressed: provider.course == null
                          ? null
                          : () => navigator
                                  .pushNamed(
                                Routes.orderDetail,
                                arguments: provider.course!,
                              )
                                  .then(
                                (value) {
                                  if (value == true) {
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
                    ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                ),
                child: Image.network(
                  context.select<CourseDetailPageProvider, String>(
                    (provider) => provider.course?.background ?? "",
                  ),
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Text(
                      'Unable to load image!',
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
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
      // elevation: AppDimens.smallElevation,
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
            provider.toggleSaveCourse(id);
          },
          icon: Icon(
            context.select<CourseDetailPageProvider, bool>(
              (provider) => provider.course?.saved ?? false,
            )
                ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded,
            color: AppColors.neutral.shade900,
          ),
        ),
      ],
    );
  }

  @override
  void initialization(BuildContext context) {
    id = context.getArgument<String>() ?? "";
    provider.getCourseDetail(id);
  }
}

class _CouseDetailTab extends StatefulWidget {
  const _CouseDetailTab({Key? key}) : super(key: key);

  @override
  State<_CouseDetailTab> createState() => _CouseDetailTabState();
}

class _CouseDetailTabState
    extends PageLoadingStateful<CourseDetailPageProvider, _CouseDetailTab>
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
        body: Selector<CourseDetailPageProvider, Course?>(
          selector: (_, provider) => provider.course,
          builder: (_, course, child) => TabBarView(
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

  @override
  void initialization(BuildContext context) {}
}
