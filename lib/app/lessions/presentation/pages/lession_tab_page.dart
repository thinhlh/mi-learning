part of 'lession_page.dart';

class _LessionTabPage extends StatefulWidget {
  final BoxConstraints parentConstraint;

  const _LessionTabPage({
    Key? key,
    required this.parentConstraint,
  }) : super(key: key);

  @override
  State<_LessionTabPage> createState() => __LessionTabPageState();
}

class __LessionTabPageState extends State<_LessionTabPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentTabIndex,
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          bottom: TabBar(
            labelStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
            onTap: (index) {
              if (index == 2) {
                showBarModalBottomSheet(
                  context: context,
                  builder: (_) => RouteUtil.createPageProvider(
                    provider: (_) => LessionQuestionAnswerPageProvider(),
                    child: WillPopScope(
                      onWillPop: () async {
                        _tabController.animateTo(currentTabIndex);

                        return true;
                      },
                      child: LessionQuestionAnswerPage(),
                    ),
                  ),
                );
              } else {
                currentTabIndex = index;
              }
            },
            unselectedLabelStyle: context.textTheme.titleMedium,
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.zero,
            tabs: const [
              Tab(text: 'Notes'),
              Tab(text: 'Course Content'),
              Tab(text: 'Q&A'),
            ],
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            RouteUtil.createPageProvider(
              child: _LessionNotePage(widget.parentConstraint),
              provider: (_) => LessionNotePageProvider(),
            ),
            RouteUtil.createPageProvider(
              child: LessionCourseContentPage(),
              provider: (_) => LessionCourseContentPageProvider(),
            ),
            RouteUtil.createPageProvider(
              child: LessionQuestionAnswerPage(),
              provider: (_) => LessionQuestionAnswerPageProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
