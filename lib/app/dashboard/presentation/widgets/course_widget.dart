import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseWidget extends StatelessWidget {
  final int id;
  const CourseWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      transitionOnUserGestures: true,
      child: GestureDetector(
        onTap: () => context.navigator.pushNamed(
          Routes.courseDetail,
          arguments: id,
        ),
        child: SizedBox(
          width: 0.8.sw,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.mediumRadius,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.largeWidthDimens,
                vertical: AppDimens.largeWidthDimens,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppDimens.mediumRadius),
                        ),
                        child: Image.asset(
                          'assets/images/flutter-course.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter advance course - 37 hours',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: AppStyles.bold,
                          ),
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Text(
                          'Dr Angela Yu',
                          style: context.textTheme.subtitle1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$' + 12.77.toStringAsFixed(2),
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: RatingWidget(rating: 4.7),
                            ),
                          ],
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        FittedBox(
                          child: Wrap(
                            spacing: AppDimens.mediumWidthDimens,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.all(AppDimens.smallWidthDimens),
                                color: Colors.amber.shade200,
                                child: Text(
                                  'Bestseller',
                                  style: context.textTheme.labelLarge,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.all(AppDimens.smallWidthDimens),
                                color: Colors.blue.shade200,
                                child: Text(
                                  'Software',
                                  style: context.textTheme.labelLarge,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.all(AppDimens.smallWidthDimens),
                                color: Colors.green.shade200,
                                child: Text(
                                  'Flutter',
                                  style: context.textTheme.labelLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            color: AppColors.neutral.shade50,
          ),
        ),
      ),
    );
  }
}
