import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class LandingPagePosition extends StatelessWidget {
  final int chosenIndex;
  final int length;
  const LandingPagePosition({
    Key? key,
    required this.chosenIndex,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.r,
      child: ListView.builder(
        itemCount: length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Container(
          width: 12.r,
          margin: EdgeInsets.only(
            right: AppDimens.mediumWidthDimens,
          ),
          decoration: BoxDecoration(
            color: chosenIndex == index ? AppColors.tetiary : null,
            border: Border.all(
              color: AppColors.tetiary,
              style: BorderStyle.solid,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
