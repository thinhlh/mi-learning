import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        width: double.infinity,
        height: 0.22.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.largeRadius),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/event-card-background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '12:55:29',
                  style: context.textTheme.titleLarge,
                ),
              ],
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Text(
              'English Class',
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Text(
              'starting soon',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: AppStyles.bold,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.mediumWidthDimens,
                    vertical: AppDimens.largeWidthDimens,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppDimens.extraLargeRadius,
                    ),
                    color: Colors.amber,
                  ),
                  child: Text(
                    'Join Class',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: AppColors.neutral.shade50,
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
