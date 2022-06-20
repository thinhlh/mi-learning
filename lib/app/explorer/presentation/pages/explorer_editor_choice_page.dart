part of 'explorer_page.dart';

class _ExplorerEditorChoicePage
    extends PageLoadingStateless<ExplorerEditorChoicePageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
      ),
      child: Column(
        children: [
          Visibility(
            visible: true,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Tutors\' Choice',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: AppStyles.extraBold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A roating selection of the best courses, handpicked by the Mi Learning tutors.',
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: AppStyles.normal,
                            ),
                          ),
                          SizedBox(height: AppDimens.largeHeightDimens),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'OK',
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.primarySwatch.shade500,
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/medal.png',
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Editors\' Choice Courses',
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          SizedBox(
            height: 0.35.sh,
            child: Selector<ExplorerPageProvider, List<Course>>(
              selector: (_, provider) => provider.courses,
              builder: (_, courses, child) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: min(courses.length, 3),
                itemBuilder: (_, index) => CourseMediumWidget(
                  course: courses[index],
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
        ],
      ),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);

    provider.tutorChoiceCourses = context.read<ExplorerPageProvider>().courses
      ..shuffle();
  }
}
