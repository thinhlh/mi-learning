import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_about_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_discuss_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_lessions_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_ratings_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
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
                'Flutter TDD Clean Architecture Course',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.extraBold,
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'by Reso coder',
                style: context.textTheme.caption?.copyWith(
                  fontSize: context.textTheme.subtitle2?.fontSize,
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                ),
                child: Image.asset(
                  'assets/images/hoang_thinh.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                elevation: AppDimens.largeElevation,
                clipBehavior: Clip.hardEdge,
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            const Expanded(child: _CouseDetailAppBar())
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
    );
  }

  @override
  void initialization(BuildContext context) {
    id = context.getArgument<int>() ?? 0;
  }
}

class _CouseDetailAppBar extends StatefulWidget {
  const _CouseDetailAppBar({Key? key}) : super(key: key);

  @override
  State<_CouseDetailAppBar> createState() => __CouseDetailAppBarState();
}

class __CouseDetailAppBarState extends State<_CouseDetailAppBar>
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          bottom: TabBar(
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
        body: TabBarView(
          controller: tabController,
          children: [
            const CourseDetailAboutPage(),
            CourseDetailLessionsPage(
              lessionAnimation: lessionAnimation,
              lessionAnimationController: lessionAnimationController,
            ),
            const CourseDetailDiscussPage(),
            const CourseDetailRatingsPage(),
          ],
        ),
      ),
    );
  }
}
