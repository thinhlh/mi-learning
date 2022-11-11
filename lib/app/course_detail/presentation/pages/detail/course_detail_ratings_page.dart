import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/rating.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/rating_bar.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/review_widget.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CourseDetailRatingsPage
    extends PageLoadingStateless<CourseDetailPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!provider.course.enrolled) {
            showDialog(
              context: context,
              builder: (_) => WDialog(
                dialogType: DialogType.info,
                content: 'You must enrolled this class to give a rating.',
                onActions: const [],
              ),
            );
          } else {
            showModalBottomSheet(
              context: context,
              builder: (_) => ChangeNotifierProvider.value(
                value: provider,
                builder: (ctx, child) => Scaffold(
                  body: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimens.mediumHeightDimens,
                      horizontal: AppDimens.mediumWidthDimens,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Rating our course!',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        Selector<CourseDetailPageProvider, int>(
                          selector: (_, provider) => provider.currentRatingStar,
                          builder: (_, currentRatingStar, child) =>
                              RatingWidget(
                            rating: currentRatingStar.toDouble(),
                            direction: Axis.horizontal,
                            showValue: false,
                            onStarTap: (star) {
                              provider.currentRatingStar = star;
                            },
                          ),
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        WTextField(
                          label: 'content',
                          icon: Icons.feedback_outlined,
                          inputType: TextInputType.multiline,
                          maxLines: 10,
                          controller: provider.ratingController,
                          maxLength: 300,
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              showLoading(ctx, true);
                              provider.submitReviews().then((value) {
                                showLoading(
                                  ctx,
                                  false,
                                );
                                ctx.navigator.pop();
                              });
                            },
                            child: const Text(
                              'Submit',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimens.largeRadius,
                ),
              ),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
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
                          rating: provider.course.courseRatings.average,
                          direction: Axis.vertical,
                          showSubTitle: true,
                          totalRating:
                              provider.course.courseRatings.ratings.length,
                        ),
                      ),
                      SizedBox(width: AppDimens.extraLargeWidthDimens),
                      Expanded(
                        flex: 2,
                        child: Builder(builder: (context) {
                          int index = 1;
                          return Column(
                            children: provider
                                .course.courseRatings.ratingAverageByStar
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
              Selector<CourseDetailPageProvider, List<Rating>>(
                selector: (_, provider) =>
                    provider.course.courseRatings.ratings,
                builder: (_, ratings, child) => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ReviewWidget(
                    rating: ratings[index],
                  ),
                  itemCount: ratings.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
