import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class RatingBar extends StatefulWidget {
  final int ratingValue;
  final Duration animationDuration;
  final int ratingPercent;

  const RatingBar({
    Key? key,
    required this.ratingValue,
    required this.animationDuration,
    required this.ratingPercent,
  }) : super(key: key);

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int currentRatingPercent = 0;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          currentRatingPercent = widget.ratingPercent;
        });
      }
    });

    return Row(
      children: [
        // ignore: unnecessary_brace_in_string_interps
        Text('${widget.ratingValue} star', style: context.textTheme.bodyMedium),
        SizedBox(width: AppDimens.largeWidthDimens),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimens.smallRadius,
            ),
            child: Stack(
              children: [
                Container(
                  color: AppColors.neutral.shade100,
                  height: 10.w,
                ),
                AnimatedSize(
                  curve: Curves.easeOutCubic,
                  duration: widget.animationDuration,
                  child: LayoutBuilder(
                    builder: (_, constraint) => Container(
                      color: AppColors.secondary,
                      height: 10.w,
                      width: currentRatingPercent * constraint.maxWidth / 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: AppDimens.mediumWidthDimens),
        Expanded(
          flex: 1,
          child: FittedBox(
            child: Text(
              '${(widget.ratingPercent < 10) ? '  ' : ''}${widget.ratingPercent}%',
              style: context.textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
