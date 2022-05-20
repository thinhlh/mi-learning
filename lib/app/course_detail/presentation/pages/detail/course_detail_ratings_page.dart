import 'package:flutter/material.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/detail/course_detail_ratings_page_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/rating_bar.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailRatingsPage
    extends PageLoadingStateless<CourseDetailRatingsPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppDimens.largeHeightDimens),
          Card(
            color: AppColors.neutral.shade200,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(AppDimens.largeWidthDimens),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: RatingWidget(
                      showValue: true,
                      showRatingAnimation: true,
                      rating: 4.0,
                      direction: Axis.vertical,
                      showSubTitle: true,
                    ),
                  ),
                  SizedBox(width: AppDimens.extraLargeWidthDimens),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        RatingBar(
                          ratingValue: 5,
                          animationDuration: Duration(seconds: 2),
                          ratingPercent: 60,
                        ),
                        RatingBar(
                          ratingValue: 4,
                          animationDuration: Duration(seconds: 2),
                          ratingPercent: 18,
                        ),
                        RatingBar(
                          ratingValue: 3,
                          animationDuration: Duration(seconds: 2),
                          ratingPercent: 12,
                        ),
                        RatingBar(
                          ratingValue: 2,
                          animationDuration: Duration(seconds: 2),
                          ratingPercent: 7,
                        ),
                        RatingBar(
                          ratingValue: 1,
                          animationDuration: Duration(seconds: 2),
                          ratingPercent: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: AppDimens.smallWidthDimens),
            child: Text(
              'Reviews',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: AppStyles.bold,
              ),
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => ListTile(
              minVerticalPadding: AppDimens.mediumHeightDimens,
              // contentPadding: EdgeInsets.all(0),
              isThreeLine: true,
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/user-avatar-3.jpg',
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leo Parker',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                  RatingWidget(
                    rating: 4.5,
                    showValue: false,
                    starSize: AppDimens.smallIcon,
                  )
                ],
              ),
              subtitle: ExpandableText(
                text:
                    "It's so amazing. I've learned so much from this course. I can't begin to stress the kind of impact these videos has made in my Flutter career.",
                maxLines: 3,
                showMoreText: 'Read more',
                textStyle: context.textTheme.bodyMedium?.copyWith(),
                showTextStyle: context.textTheme.caption,
              ),
            ),
            itemCount: 100,
          )
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
