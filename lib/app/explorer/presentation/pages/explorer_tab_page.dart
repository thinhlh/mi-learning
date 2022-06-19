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
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            RouteUtil.createPageBloc(
              child: _ExplorerForYouPage(),
              bloc: (_) => ExplorerForYouPageBloc(),
            ),
            RouteUtil.createPageBloc(
              child: _ExplorerTopChartPage(),
              bloc: (_) => ExplorerTopChartPageBloc(),
            ),
            RouteUtil.createPageBloc(
              child: _ExplorerCategoriesPage(),
              bloc: (_) => ExplorerCategoriesPageBloc(GetIt.I()),
            ),
            RouteUtil.createPageBloc(
              child: _ExplorerEditorChoicePage(),
              bloc: (_) => ExplorerEditorChoicePageBloc(),
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
    );
  }
}
