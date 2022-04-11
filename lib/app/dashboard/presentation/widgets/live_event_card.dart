import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class LiveEventCard extends StatefulWidget {
  const LiveEventCard({Key? key}) : super(key: key);

  @override
  State<LiveEventCard> createState() => _LiveEventCardState();
}

class _LiveEventCardState extends State<LiveEventCard>
    with SingleTickerProviderStateMixin {
  final flipController = FlipCardController();

  bool isFront = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
        child: child,
      ),
    );
  }

  Widget _buildFront(BuildContext context) {
    return Column(
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
        const Spacer(),
        Row(
          children: [
            Text(
              'Dr Angela Yu',
              style: context.textTheme.titleSmall?.copyWith(),
            ),
            const Spacer(),
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
              '12:55:40',
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
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, index) => CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  itemCount: 4,
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
