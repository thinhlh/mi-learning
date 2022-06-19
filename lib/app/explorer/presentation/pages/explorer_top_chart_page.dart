part of 'explorer_page.dart';

class _ExplorerTopChartPage
    extends PageLoadingStateless<ExplorerTopChartPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Selector<ExplorerPageProvider, List<Course>>(
      selector: (_, provider) => provider.courses
        ..sort(
          (a, b) => b.courseRatings.average.compareTo(a.courseRatings.average),
        ),
      builder: (_, courses, child) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        itemBuilder: (_, index) => CourseTopChartWidget(
          course: courses[index],
          index: index,
        ),
        itemCount: courses.length,
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}
}
