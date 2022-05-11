import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/course_widget.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/live_event_card.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/my_course_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class DashboardPage extends PageLoadingStateless<DashboardProvider> {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        child: SingleChildScrollView(
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
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      centerTitle: false,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: AppDimens.avatar,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/avatar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: AppDimens.largeWidthDimens),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoang Thinh',
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 24.sp,
                  fontWeight: AppStyles.extraBold,
                ),
              ),
              SizedBox(height: AppDimens.smallHeightDimens),
              Text(
                'Developer',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppDimens.largeWidthDimens),
          child: IconButton(
            onPressed: () {},
            icon: Badge(
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
            Text(
              'Show all',
              style: context.textTheme.subtitle2?.copyWith(
                color: AppColors.tetiary,
              ),
            ),
          ],
        ),
        Container(
          height: 0.16.sh,
          margin: EdgeInsets.only(top: AppDimens.mediumHeightDimens),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => const MyCourseWidget(),
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            shrinkWrap: true,
          ),
        )
      ],
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
          child: ListView.builder(
            itemBuilder: (_, index) => CourseWidget(id: index),
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }

  @override
  void initialization(BuildContext context) {}
}
