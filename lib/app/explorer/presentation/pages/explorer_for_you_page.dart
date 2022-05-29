part of 'explorer_page.dart';

class _ExplorerForYouPage
    extends PageLoadingStateless<ExplorerForYouPageProvider> {
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) => const CourseMediumWidget(),
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
              const CourseLargeWidget(),
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) => const CourseSmallWidget(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
