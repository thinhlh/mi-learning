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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Editors\' Choice Courses',
                style: context.textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          SizedBox(
            height: 0.35.sh,
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
                          width: 0.8.sw,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Row(
                      children: [
                        Container(
                          width: 70.w,
                          height: 70.w,
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
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                            Text(
                              'Flutter • Beginner • Mobile',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              '4.8 ★ - 24 hours',
                              style: context.textTheme.bodyMedium,
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
          SizedBox(height: AppDimens.extraLargeHeightDimens),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
