part of 'explorer_page.dart';

class _ExplorerForYouPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExplorerForYouState();
}

class _ExplorerForYouState
    extends PageLoadingStateful<ExplorerForYouPageProvider, _ExplorerForYouPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
        vertical: AppDimens.largeHeightDimens,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feature courses',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.extraBold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          SizedBox(
            height: 0.35.sh,
            child: Selector<ExplorerPageProvider, List<Course>>(
              selector: (_, provider) => provider.courses,
              builder: (_, courses, child) => courses.isNotEmpty
                  ? _FeatureCourses(
                      courses: courses,
                    )
                  : Shimmer.fromColors(
                      baseColor: AppColors.baseShimmerColor,
                      highlightColor: AppColors.highlightShimmerColor,
                      enabled: true,
                      child: _FeatureCourses(
                        courses: courses,
                      ),
                    ),
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Limited-time course',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.extraBold,
                ),
              ),
              SizedBox(height: AppDimens.largeHeightDimens),
              Selector<ExplorerPageProvider, List<Course>>(
                selector: (_, provider) => provider.courses,
                builder: (_, courses, child) => courses.isEmpty
                    ? Shimmer.fromColors(
                        enabled: true,
                        child: SizedBox(
                          width: 0.8.sw,
                          height: 0.4.sh,
                        ),
                        baseColor: AppColors.baseShimmerColor,
                        highlightColor: AppColors.highlightShimmerColor)
                    : CourseLargeWidget(
                        course: courses.last,
                      ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feature courses',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.extraBold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          SizedBox(
            height: 0.25.sh,
            child: Selector<ExplorerPageProvider, List<Course>>(
              selector: (_, provider) => provider.courses,
              builder: (_, courses, child) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) => CourseSmallWidget(
                  course: courses[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}

  @override
  bool get wantKeepAlive => true;
}

class _FeatureCourses extends StatelessWidget {
  final List<Course> courses;
  const _FeatureCourses({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: courses.length,
      itemBuilder: (_, index) => CourseMediumWidget(
        course: courses[index],
      ),
    );
  }
}
