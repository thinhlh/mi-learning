import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class MyCourseWidget extends StatelessWidget {
  const MyCourseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        AppDimens.largeWidthDimens,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimens.mediumRadius,
        ),
        // border: Border.all(color: AppColors.neutral.shade500),
        color: AppColors.neutral.shade50,
      ),
      margin: EdgeInsets.only(
        right: AppDimens.largeWidthDimens,
      ),
      width: 0.8.sw,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppDimens.smallRadius,
                ),
                child: SvgPicture.asset(
                  'assets/images/swift.svg',
                  fit: BoxFit.cover,
                  height: 60.r,
                  width: 60.r,
                ),
              ),
              SizedBox(width: AppDimens.mediumWidthDimens),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'iOS & Swift - The Complete iOS App Development Bootcamp 2022',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: AppStyles.extraBold,
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Text(
                      "1. Intro to the Course. What's coming up?",
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleSmall?.copyWith(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '23 lessions',
                style: context.textTheme.subtitle2?.copyWith(
                  color: AppColors.primarySwatch.shade500,
                  fontWeight: AppStyles.bold,
                ),
              ),
              Text(
                '52 lessions',
                style: context.textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Expanded(
              child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.neutral.shade300,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(AppDimens.extraLargeHeightDimens),
                    right: Radius.circular(AppDimens.extraLargeHeightDimens),
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraint) {
                  return Container(
                    width: constraint.maxWidth * 23 / 52,
                    decoration: BoxDecoration(
                      color: AppColors.primarySwatch.shade100,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(AppDimens.extraLargeHeightDimens),
                        right:
                            Radius.circular(AppDimens.extraLargeHeightDimens),
                      ),
                    ),
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
