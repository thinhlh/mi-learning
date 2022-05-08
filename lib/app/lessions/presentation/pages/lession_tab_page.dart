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

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
              provider: (_) => LessionCourseContentProvider(),
            ),
            RouteUtil.createPageProvider(
              child: LessionQuestionAnswerPage(),
              provider: (_) => LessionQuestionAnswerProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
