import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/common/domain/entity/course_rating.dart';
import 'package:mi_learning/app/course_detail/presentation/bloc/course_detail_page_bloc.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/rating_bar.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/review_widget.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailRatingsPage
    extends PageLoadingStateless<CourseDetailPageBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return BlocSelector<CourseDetailPageBloc, CourseDetailPageState,
        CourseRating?>(
      selector: (state) {
        return (state is CourseDetailPageLoadedState)
            ? state.course.courseRatings
            : null;
      },
      builder: (context, courseRatings) {
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
                            rating: courseRatings?.average ?? 0.0,
                            direction: Axis.vertical,
                            showSubTitle: true,
                            totalRating: courseRatings?.ratings.length ?? 0,
                          ),
                        ),
                        SizedBox(width: AppDimens.extraLargeWidthDimens),
                        Expanded(
                          flex: 2,
                          child: Builder(
                            builder: (_) {
                              int index = 1;
                              return Column(
                                children:
                                    (courseRatings?.ratingAverageByStar ?? [])
                                        .map<RatingBar>((e) {
                                          return RatingBar(
                                            ratingValue: index++,
                                            animationDuration:
                                                const Duration(seconds: 2),
                                            ratingPercent: e,
                                          );
                                        })
                                        .toList()
                                        .reversed
                                        .toList(),
                              );
                            },
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
                  itemBuilder: (_, index) => ReviewWidget(
                    rating: courseRatings?.ratings[index],
                  ),
                  itemCount: courseRatings?.ratings.length,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
