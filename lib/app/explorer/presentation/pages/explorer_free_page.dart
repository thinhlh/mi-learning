part of 'explorer_page.dart';

class _ExplorerFreePage extends PageLoadingStateless<ExplorerFreeProvider> {
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
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.neutral.shade500,
                    ),
                    borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/flutter-course.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppDimens.largeWidthDimens),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter Crash Course with TDD • Ends in 1 days',
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(fontWeight: AppStyles.extraLight),
                            ),
                            SizedBox(height: AppDimens.mediumHeightDimens),
                            Text(
                              'Heads up to Flutter course with TDD development process as a professional',
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: AppStyles.normal,
                              ),
                            ),
                            SizedBox(height: AppDimens.extraLargeHeightDimens),
                            Text(
                              'Enroll',
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.primarySwatch.shade500,
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(right: AppDimens.largeWidthDimens),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppDimens.largeRadius,
                        ),
                        child: Image.asset(
                          'assets/images/flutter-course.jpeg',
                          fit: BoxFit.cover,
                          width: 0.6.sw,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDimens.largeRadius),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/user-avatar-1.jpg',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimens.largeWidthDimens),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter Crash Course',
                              style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                            Text(
                              'Flutter • Beginner • Mobile',
                              style: context.textTheme.bodySmall,
                            ),
                            Text(
                              '4.8 ★ - 24 hours',
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
