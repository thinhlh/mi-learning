import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_page_provider.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/recommended_course_widget.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/live_event_card.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/my_course_widget.dart';
import 'package:mi_learning/app/home/presentation/providers/home_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/extensions/string_extension.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState
    extends PageLoadingStateful<DashboardPageProvider, DashboardPage>
    with AutomaticKeepAliveClientMixin {
  _DashboardPageState() : super();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildPage(context);
  }

  @override
  Widget buildPage(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => fetchData(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.largeWidthDimens,
            vertical: AppDimens.largeHeightDimens,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.largeHeightDimens),
                const LiveEventCard(),
                SizedBox(height: AppDimens.largeHeightDimens),
                _buildMyLearning(context),
                SizedBox(height: AppDimens.largeHeightDimens),
                _buildRecommendation(context),
                SizedBox(height: AppDimens.largeHeightDimens),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      centerTitle: false,
      elevation: 2,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => navigator.pushNamed(
                Routes.setting,
                arguments: provider.userInfo,
              ),
              child: SizedBox.square(
                dimension: AppDimens.avatar,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: NetworkImage(
                      context.select<DashboardPageProvider, String>(
                        (provider) => provider.userInfo?.avatar ?? "",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.select<DashboardPageProvider, String>(
                    ((provider) => provider.userInfo?.name ?? ""),
                  ),
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: AppStyles.extraBold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  context.select<DashboardPageProvider, String>(
                    (provider) =>
                        (provider.userInfo?.occupation ?? "").toCamelCase(),
                  ),
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppDimens.largeWidthDimens),
          child: IconButton(
            onPressed: () {
              navigator.pushNamed(Routes.notification);
            },
            icon: Badge(
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              padding: EdgeInsets.all(6.r),
              position: BadgePosition.topEnd(end: -2, top: -2),
              badgeColor: Colors.red,
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryLight,
                size: 32.r,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMyLearning(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Learning',
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: AppStyles.bold,
              ),
            ),
            GestureDetector(
              onTap: () => navigator.pushNamed(
                Routes.myCourses,
                arguments: provider.myCourse,
              ),
              child: Text(
                'Show all',
                style: context.textTheme.subtitle2?.copyWith(
                  color: AppColors.tetiary,
                ),
              ),
            ),
          ],
        ),
        Selector<DashboardPageProvider, List<MyCourse>?>(
          selector: (_, provider) => provider.myCourse,
          builder: (_, myCourses, child) => myCourses == null
              ? Shimmer.fromColors(
                  enabled: true,
                  baseColor: AppColors.baseShimmerColor,
                  highlightColor: AppColors.highlightShimmerColor,
                  child: _buildMyLearningListView(myCourses),
                )
              : _buildMyLearningListView(myCourses),
        )
      ],
    );
  }

  Widget _buildMyLearningListView(List<MyCourse>? myCourses) {
    return Container(
      height: 0.16.sh,
      margin: EdgeInsets.only(top: AppDimens.mediumHeightDimens),
      child: myCourses?.isEmpty ?? true
          ? GestureDetector(
              onTap: () => context.read<HomeProvider>().tabController.index = 1,
              child: Center(
                child: Text(
                  'You have not enrolled any courses, try out now!',
                  style: context.textTheme.titleLarge,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: AppDimens.largeWidthDimens,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => MyCourseWidget(
                myCourse: myCourses?[index],
              ),
              scrollDirection: Axis.horizontal,
              itemCount: min(myCourses?.length ?? 3, 3),
            ),
    );
  }

  Widget _buildRecommendation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: AppStyles.bold,
          ),
        ),
        Container(
          height: 0.42.sh,
          margin: EdgeInsets.only(top: AppDimens.mediumHeightDimens),
          child: Selector<DashboardPageProvider, List<RecommendedCourse>?>(
            selector: (_, provider) => provider.recommendedCourse,
            builder: (_, recommendedCourse, child) =>
                (recommendedCourse?.isEmpty == true)
                    ? Text(
                        'You have no courses to learn yet.',
                        style: context.textTheme.titleLarge,
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) => RecommendedCourseWidget(
                          course: recommendedCourse?[index],
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedCourse?.length ?? 10,
                        shrinkWrap: true,
                      ),
          ),
        )
      ],
    );
  }

  @override
  void initialization(BuildContext context) {
    fetchData();
  }

  void fetchData() {
    provider.getBasicUserInfo();
    provider.getMyCourses();
    provider.getRecommendedCourses();
  }

  @override
  bool get wantKeepAlive => true;
}
