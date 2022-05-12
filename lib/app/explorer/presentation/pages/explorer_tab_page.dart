part of 'explorer_page.dart';

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
              child: _ExplorerForYouPage(),
              provider: (_) => ExplorerForYouProvider(),
            ),
            RouteUtil.createPageProvider(
              child: _ExplorerTopChartPage(),
              provider: (_) => ExplorerTopChartProvider(),
            ),
            RouteUtil.createPageProvider(
              child: _ExplorerCategoriesPage(),
              provider: (_) => ExplorerCategoriesProvider(),
            ),
            RouteUtil.createPageProvider(
              child: _ExplorerEditorChoicePage(),
              provider: (_) => ExplorerEditorChoiceProvider(),
            ),
            RouteUtil.createPageProvider(
              child: _ExplorerPremiumPage(),
              provider: (_) => ExplorerPremiumProvider(),
            ),
            RouteUtil.createPageProvider(
              child: _ExplorerFreePage(),
              provider: (_) => ExplorerFreeProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
