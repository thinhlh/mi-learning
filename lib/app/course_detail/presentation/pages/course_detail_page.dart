import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_back_button.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  color: AppColors.secondary,
                ),
                SizedBox(width: AppDimens.smallWidthDimens),
                Text(
                  '2hr 38m',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.secondary,
                    fontWeight: AppStyles.bold,
                  ),
                ),
              ],
            ),
            Hero(
              tag: id,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(
                    0.9,
                    0.85,
                  ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                  ),
                  child: Image.asset(
                    'assets/images/flutter-course.jpeg',
                  ),
                  elevation: AppDimens.largeElevation,
                  clipBehavior: Clip.hardEdge,
                ),
              ),
            ),
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
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    controller = AnimationController(vsync: this, value: 0);
    Tween<double>(begin: 0, end: 0.8).animate(controller);
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
            isScrollable: false,
            unselectedLabelStyle: context.textTheme.titleMedium,
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Lession'),
              Tab(text: 'Discuss'),
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            _buildAbout(context),
            _buildLession(context),
            _buildDiscuss(context),
          ].map((e) => SingleChildScrollView(child: e)).toList(),
        ),
      ),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimens.largeHeightDimens),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '12',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  'Lessions',
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '38,729',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  'Students',
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '23',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  'Hours',
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        Divider(
          height: AppDimens.extraLargeHeightDimens,
          color: AppColors.neutral.shade500,
        ),
        ExpandableText(
          text:
              "Keeping your code clean and tested are the two most important development practices. In Flutter, this is even more true than with other frameworks. On one hand, it's nice to hack a quick app together, on the other hand, larger projects start falling apart when you mix the business logic everywhere. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase.",
          maxLines: 3,
          textStyle: context.textTheme.caption?.copyWith(
            fontSize: AppDimens.mediumText,
          ),
          showTextStyle: context.textTheme.caption?.copyWith(
            fontWeight: AppStyles.extraBold,
            color: AppColors.primarySwatch.shade500,
          ),
        ),
      ],
    );
  }

  Widget _buildLession(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimens.largeHeightDimens),
        AnimatedContainer(
          duration: Duration.zero,
          child: CircularProgressIndicator.adaptive(
            value: controller.value,
            strokeWidth: 6,
            backgroundColor: AppColors.neutral.shade400,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.primarySwatch.shade300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscuss(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimens.largeHeightDimens),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '12',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  'Lessions',
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '38,729',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  'Students',
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '23',
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  'Hours',
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        Divider(
          height: AppDimens.extraLargeHeightDimens,
          color: AppColors.neutral.shade500,
        ),
        ExpandableText(
          text:
              "Keeping your code clean and tested are the two most important development practices. In Flutter, this is even more true than with other frameworks. On one hand, it's nice to hack a quick app together, on the other hand, larger projects start falling apart when you mix the business logic everywhere. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase.",
          maxLines: 3,
          textStyle: context.textTheme.caption?.copyWith(
            fontSize: AppDimens.mediumText,
          ),
          showTextStyle: context.textTheme.caption?.copyWith(
            fontWeight: AppStyles.extraBold,
            color: AppColors.primarySwatch.shade500,
          ),
        ),
      ],
    );
  }
}
