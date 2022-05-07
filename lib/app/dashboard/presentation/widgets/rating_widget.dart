import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class RatingWidget extends StatefulWidget {
  final double rating;
  final Axis direction;
  final bool showValue;
  final bool showSubTitle;
  RatingWidget({
    Key? key,
    required this.rating,
    this.direction = Axis.horizontal,
    this.showValue = true,
    this.showSubTitle = false,
  }) : super(key: key);

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double currentRatingValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = List.generate(
      5,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Icon(
          (widget.rating - index >= 1)
              ? Icons.star
              : (widget.rating - index >= 0.5)
                  ? Icons.star_half
                  : Icons.star_outline,
          color: Colors.yellow.shade800,
        ),
      ),
    );

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          currentRatingValue = widget.rating;
        });
      }
    });

    return Flex(
      direction: widget.direction,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: widget.showValue,
          child: AnimatedFlipCounter(
            curve: Curves.easeOutCubic,
            duration: const Duration(seconds: 2),
            fractionDigits: 1,
            value: currentRatingValue,
            textStyle: context.textTheme.titleLarge?.copyWith(
              color: Colors.yellow.shade900,
              fontWeight: AppStyles.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: AppDimens.mediumWidthDimens),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: stars,
              ),
              Visibility(
                visible: widget.showSubTitle,
                child: Text(
                  'Based on 252 reviews',
                  style: context.textTheme.caption,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
