part of 'explorer_page.dart';

class _ExplorerTopChartPage
    extends PageLoadingStateless<ExplorerTopChartPageBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return BlocSelector<ExplorerPageBloc, ExplorerPageState, List<Course>>(
      selector: (state) {
        return ((state is ExplorerPageLoadedState) ? state.courses : <Course>[])
          ..sort(
            (a, b) =>
                b.courseRatings.average.compareTo(a.courseRatings.average),
          );
      },
      builder: (_, courses) => ListView.builder(
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
