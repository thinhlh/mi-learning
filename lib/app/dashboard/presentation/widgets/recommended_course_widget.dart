import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedCourseWidget extends StatelessWidget {
  final Course? course;
  final VoidCallback onCourseTapped;
  const RecommendedCourseWidget({
    Key? key,
    required this.course,
    required this.onCourseTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return course == null
        ? Shimmer.fromColors(
            baseColor: AppColors.baseShimmerColor,
            highlightColor: AppColors.highlightShimmerColor,
            child: _buildCourse(context),
          )
        : _buildCourse(context);
  }

  Widget _buildCourse(BuildContext context) {
    return GestureDetector(
      onTap: onCourseTapped,
      child: SizedBox(
        width: 0.8.sw,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.mediumRadius,
            ),
          ),
          elevation: 0,
          color: AppColors.neutral.shade50,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.largeWidthDimens,
              vertical: AppDimens.largeWidthDimens,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppDimens.mediumRadius),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        course?.background ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course?.title ?? "",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: AppStyles.bold,
                        ),
                      ),
                      SizedBox(height: AppDimens.smallHeightDimens),
                      Text(
                        course?.teacher.name ?? "",
                        style: context.textTheme.subtitle1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${(course?.price ?? 0.0).toStringAsFixed(2)}',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: RatingWidget(
                                rating: course?.courseRatings.average ?? 0.0),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.smallHeightDimens),
                      Container(
                        padding: EdgeInsets.all(AppDimens.smallWidthDimens),
                        color: Colors.amber.shade200,
                        child: Text(
                          course?.category ?? "",
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
