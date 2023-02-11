import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_about_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_lessons_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/detail/course_detail_ratings_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CourseDetailPage extends PageLoadingStateless<CourseDetailPageProvider> {
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
                  (provider) => provider.course.title,
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
                'by ${context.select<CourseDetailPageProvider, String>((provider) => provider.course.teacher.name)}',
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
                (provider) => provider.course.enrolled,
              )
                  ? const SizedBox.shrink()
                  : ElevatedButton(
                      onPressed: () => navigator
                          .pushNamed(
                        Routes.orderDetail,
                        arguments: provider.course,
                      )
                          .then(
                        (value) async {
                          provider.purchased = (value is bool) ? value : false;
                          if (value == true) {
                            showLoading(context, true);
                            await provider.getCourseDetail();
                            showLoading(context, false);
                          }
                        },
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
                      child: Text(
                        tr(LocaleKeys.pages_course_detail_enroll),
                        style: const TextStyle(
                          letterSpacing: 1,
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
                elevation: AppDimens.largeElevation,
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  context.select<CourseDetailPageProvider, String>(
                    (provider) => provider.course.background,
                  ),
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Text(
                      tr(LocaleKeys.pages_course_detail_unable_to_load_image),
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
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
        onPressed: () => navigator.pop(provider.purchased),
      ),
      title: Text(
        tr(LocaleKeys.pages_course_detail_course_detail),
        style: context.textTheme.titleLarge?.copyWith(),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            showLoading(context, true);
            await provider.toggleSaveCourse();
            await provider.getCourseDetail();
            showLoading(context, false);
          },
          icon: Icon(
            context.select<CourseDetailPageProvider, bool>(
              (provider) => provider.course.saved,
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
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);
    provider.setCourseWithOutNotify(context.getArgument<Course>()!);
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: AppColors.neutral.shade50,
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
            tabs: [
              Tab(text: tr(LocaleKeys.pages_course_detail_about)),
              Tab(text: tr(LocaleKeys.pages_course_detail_lessons)),
              Tab(text: tr(LocaleKeys.pages_course_detail_discuss)),
              Tab(text: tr(LocaleKeys.pages_course_detail_ratings)),
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: [
            CourseDetailAboutPage(),
            const CourseDetailLessonsPage(),
            // CourseDetailDiscussPage(),
            CourseDetailRatingsPage(),
          ],
        ),
      ),
    );
  }
}
