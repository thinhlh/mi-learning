import 'package:flutter/material.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/rating_bar.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/review_widget.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailRatingsPage
    extends PageLoadingStateless<CourseDetailPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: AppColors.neutral.shade50,
      child: SingleChildScrollView(
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
                        rating: bloc.course?.courseRatings.average ?? 0.0,
                        direction: Axis.vertical,
                        showSubTitle: true,
                        totalRating:
                            bloc.course?.courseRatings.ratings.length ?? 0,
                      ),
                    ),
                    SizedBox(width: AppDimens.extraLargeWidthDimens),
                    Expanded(
                      flex: 2,
                      child: Builder(builder: (context) {
                        int index = 1;
                        return Column(
                          children: (bloc.course?.courseRatings
                                      .ratingAverageByStar ??
                                  [])
                              .map<RatingBar>((e) {
                                return RatingBar(
                                  ratingValue: index++,
                                  animationDuration: const Duration(seconds: 2),
                                  ratingPercent: e,
                                );
                              })
                              .toList()
                              .reversed
                              .toList(),
                        );
                      }),
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
              itemBuilder: (_, index) => ReviewWidget(
                rating: bloc.course?.courseRatings.ratings[index],
              ),
              itemCount: bloc.course?.courseRatings.ratings.length,
            )
          ],
        ),
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}
}
