part of 'lession_page.dart';

class _LessionTabPage extends StatefulWidget {
  final CourseDetail courseDetail;
  final double safePadding;
  const _LessionTabPage({
    Key? key,
    required this.courseDetail,
    required this.safePadding,
  }) : super(key: key);

  @override
  State<_LessionTabPage> createState() => __LessionTabPageState();
}

class __LessionTabPageState extends State<_LessionTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print('safePadding ' + widget.safePadding.toString());
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
                  builder: (_) => RouteUtil.createPageBloc(
                    bloc: (_) => LessionQuestionAnswerPageProvider(),
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
            RouteUtil.createPageBloc(
              child: _LessionNotePage(
                safePadding: widget.safePadding,
              ),
              bloc: (_) => LessionNotePageProvider(
                courseDetail: widget.courseDetail,
              ),
            ),
            RouteUtil.createPageBloc(
              child: LessionCourseContentPage(),
              bloc: (_) => LessionCourseContentPageProvider(
                course: widget.courseDetail,
              ),
            ),
            RouteUtil.createPageBloc(
              child: LessionQuestionAnswerPage(),
              bloc: (_) => LessionQuestionAnswerPageProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
