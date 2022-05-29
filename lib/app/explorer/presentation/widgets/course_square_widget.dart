import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseSquareWidget extends StatelessWidget {
  const CourseSquareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.sh,
      width: 0.3.sw,
      margin: EdgeInsets.only(
        right: AppDimens.largeWidthDimens,
      ),
      child: Column(
        children: [
          Material(
            type: MaterialType.transparency,
            elevation: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                24,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  'assets/images/flutter-course.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            'Flutter course from crash.',
            style: context.textTheme.titleSmall,
            maxLines: 2,
          ),
          SizedBox(height: AppDimens.smallHeightDimens),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '4.5 ★',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                '\$38',
                style: context.textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
    );
  }
}
