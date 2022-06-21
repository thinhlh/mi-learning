import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_page_provider.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_category_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_large_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_medium_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_small_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_square_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_top_chart_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/search/search_course_delegate.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/route_util.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

part 'explorer_for_you_page.dart';
part 'explorer_top_chart_page.dart';
part 'explorer_categories_page.dart';
part 'explorer_editor_choice_page.dart';
part 'explorer_premium_page.dart';
part 'explorer_free_page.dart';

class ExplorerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExplorerPageState();
}

class _ExplorerPageState
    extends PageLoadingStateful<ExplorerPageProvider, ExplorerPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.largeWidthDimens,
              vertical: AppDimens.largeHeightDimens,
            ),
            child: TextField(
              maxLines: 1,
              onTap: () {
                showSearch(
                  context: context,
                  delegate: SearchCourseDelegate(courses: provider.courses),
                );
              },
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.primarySwatch.shade50.withOpacity(
                  0.3,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                hintText: 'Search for courses',
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorColor: AppColors.secondary,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    tabs: const <Tab>[
                      Tab(text: 'For you'),
                      Tab(text: 'Top charts'),
                      Tab(text: 'Categories'),
                      Tab(text: 'Teachers\'s choice'),
                      // Tab(text: 'Premium'),
                      // Tab(text: 'Free'),
                    ],
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    RouteUtil.createPageProvider(
                      child: _ExplorerForYouPage(),
                      provider: (_) => ExplorerForYouPageProvider(),
                    ),
                    RouteUtil.createPageProvider(
                      child: _ExplorerTopChartPage(),
                      provider: (_) => ExplorerTopChartPageProvider(),
                    ),
                    RouteUtil.createPageProvider(
                      child: _ExplorerCategoriesPage(),
                      provider: (_) =>
                          ExplorerCategoriesPageProvider(GetIt.I()),
                    ),
                    RouteUtil.createPageProvider(
                      child: _ExplorerEditorChoicePage(),
                      provider: (_) => ExplorerEditorChoicePageProvider(),
                    ),
                    // RouteUtil.createPageProvider(
                    //   child: _ExplorerPremiumPage(),
                    //   provider: (_) => ExplorerPremiumPageProvider(),
                    // ),
                    // RouteUtil.createPageProvider(
                    //   child: _ExplorerFreePage(),
                    //   provider: (_) => ExplorerFreePageProvider(),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    showLoading(context, true);
    provider.getCourses().then((value) => showLoading(context, false));
  }
}
