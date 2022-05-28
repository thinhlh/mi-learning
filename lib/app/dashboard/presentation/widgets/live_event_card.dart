import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/livestream/presentation/pages/live.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class LiveEventCard extends StatefulWidget {
  const LiveEventCard({Key? key}) : super(key: key);

  @override
  State<LiveEventCard> createState() => _LiveEventCardState();
}

class _LiveEventCardState extends State<LiveEventCard>
    with SingleTickerProviderStateMixin {
  Duration _duration = const Duration(hours: 12, minutes: 55, seconds: 44);
  final flipController = FlipCardController();

  bool isFront = true;

  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
    flipController.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: true,
      direction: FlipDirection.HORIZONTAL,
      speed: 500,
      alignment: Alignment.center,
      fill: Fill.fillBack,
      controller: flipController,
      front: _buildSide(
        context,
        _buildFront(context),
      ),
      back: _buildSide(
        context,
        _buildBack(context),
      ),
    );
  }

  Widget _buildSide(BuildContext context, Widget child) {
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
        // height: 0.22.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.largeRadius),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/event-card-background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildFront(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            DateTimeHelper.formatDuration(_duration),
            style: context.textTheme.titleLarge,
          ),
        ),
        SizedBox(height: AppDimens.mediumHeightDimens),
        Text(
          'English Class',
          style: context.textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppDimens.mediumHeightDimens),
        Text(
          'starting soon',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: AppStyles.bold,
          ),
        ),
        SizedBox(height: AppDimens.largeHeightDimens),
        Row(
          children: [
            Text(
              'Dr Angela Yu',
              style: context.textTheme.titleSmall?.copyWith(),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => context.navigator.push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => JoinChannelVideo(),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.mediumWidthDimens,
                  vertical: AppDimens.largeWidthDimens,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimens.extraLargeRadius,
                  ),
                  color: AppColors.secondaryLight,
                ),
                child: Text(
                  'Join Class',
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.neutral.shade50,
                    fontWeight: AppStyles.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBack(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              DateTimeHelper.formatDuration(_duration),
              style: context.textTheme.titleLarge,
            ),
          ],
        ),
        SizedBox(height: AppDimens.mediumHeightDimens),
        Text(
          'Welcome to the Complete iOS App Development Bootcamp. With over 39,000 5 star ratings and a 4.8 average my iOS course is the HIGHEST RATED iOS Course in the history of Udemy! Welcome to the Complete iOS App Development Bootcamp. With over 39,000 5 star ratings and a 4.8 average my iOS course is the HIGHEST RATED iOS Course in the history of Udemy! Welcome to the Complete iOS App Development Bootcamp. With over 39,000 5 star ratings and a 4.8 average my iOS course is the HIGHEST RATED iOS Course in the history of Udemy!',
          style: context.textTheme.caption?.copyWith(
            fontWeight: AppStyles.bold,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Container(
                    clipBehavior: Clip.hardEdge,
                    width: 40.w,
                    child: Center(
                      child: index != 4
                          ? Image.asset(
                              'assets/images/user-avatar-${index + 1}.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            )
                          : Padding(
                              padding: EdgeInsets.all(4.r),
                              child: CircleAvatar(
                                backgroundColor: AppColors.tetiary,
                                child: FittedBox(
                                  child: Text(
                                    '12+',
                                    style:
                                        context.textTheme.titleSmall?.copyWith(
                                      fontWeight: AppStyles.bold,
                                      color: AppColors.neutral.shade50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    transform: Matrix4.translationValues(
                      index == 0 ? 0 : -20.w * index,
                      0,
                      0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.neutral.shade50,
                    ),
                  ),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
            GestureDetector(
              onTap: () => {},
              child: Container(
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
            ),
          ],
        ),
      ],
    );
  }
}
