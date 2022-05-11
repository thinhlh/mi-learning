import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_categories_page.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_editor_choice_page.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_for_you_page.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_free_page.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_premium_page.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_top_chart_page.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_categories_provider.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_editor_choice_provider.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_for_you_provider.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_free_provider.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_premium_provider.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_provider.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_top_chart_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/route_util.dart';

class ExplorerPage extends PageLoadingStateless<ExplorerProvider> {
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
                hintText: 'Search for apps & games',
              ),
            ),
          ),
          Expanded(
            child: _ExplorerTabPage(),
          ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}

class _ExplorerTabPage extends StatefulWidget {
  const _ExplorerTabPage({
    Key? key,
  }) : super(key: key);

  @override
  State<_ExplorerTabPage> createState() => _ExplorerTabPageState();
}

class _ExplorerTabPageState extends State<_ExplorerTabPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
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
              Tab(text: 'Premium'),
              Tab(text: 'Free'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: [
            RouteUtil.createPageProvider(
              child: ExplorerForYouPage(),
              provider: (_) => ExplorerForYouProvider(),
            ),
            RouteUtil.createPageProvider(
              child: ExplorerTopChartPage(),
              provider: (_) => ExplorerTopChartProvider(),
            ),
            RouteUtil.createPageProvider(
              child: ExplorerCategoriesPage(),
              provider: (_) => ExplorerCategoriesProvider(),
            ),
            RouteUtil.createPageProvider(
              child: ExplorerEditorChoicePage(),
              provider: (_) => ExplorerEditorChoiceProvider(),
            ),
            RouteUtil.createPageProvider(
              child: ExplorerPremiumPage(),
              provider: (_) => ExplorerPremiumProvider(),
            ),
            RouteUtil.createPageProvider(
              child: ExplorerFreePage(),
              provider: (_) => ExplorerFreeProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
