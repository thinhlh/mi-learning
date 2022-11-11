part of 'lesson_page.dart';

class _LessonTabPage extends StatefulWidget {
  final Course course;
  const _LessonTabPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<_LessonTabPage> createState() => _LessonTabPageState();
}

class _LessonTabPageState extends State<_LessonTabPage>
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
                    provider: (_) => LessonQuestionAnswerPageProvider(),
                    child: WillPopScope(
                      onWillPop: () async {
                        _tabController.animateTo(currentTabIndex);

                        return true;
                      },
                      child: LessonQuestionAnswerPage(),
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
              child: _LessonNotePage(),
              provider: (_) => LessonNotePageProvider(),
            ),
            RouteUtil.createPageProvider(
              child: LessonCourseContentPage(),
              provider: (_) => LessonCourseContentPageProvider(
                GetIt.I(),
                course: widget.course,
              ),
            ),
            RouteUtil.createPageProvider(
              child: LessonQuestionAnswerPage(),
              provider: (_) => LessonQuestionAnswerPageProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
