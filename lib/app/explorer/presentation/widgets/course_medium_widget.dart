import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseMediumWidget extends StatelessWidget {
  final Course course;
  const CourseMediumWidget({
    required this.course,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(
        Routes.courseDetail,
        arguments: course.id,
      ),
      child: SizedBox(
        height: 0.35.sh,
        width: 0.85.sw,
        child: Container(
          // padding: EdgeInsets.only(right: AppDimens.largeWidthDimens),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppDimens.largeRadius,
                  ),
                  child: Image.network(
                    course.background,
                    fit: BoxFit.cover,
                    width: 0.8.sw,
                  ),
                ),
              ),
              SizedBox(height: AppDimens.mediumHeightDimens),
              Row(
                children: [
                  Container(
                    width: 70.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.largeRadius),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          course.teacher.avatar,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimens.largeWidthDimens),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: AppStyles.bold,
                          ),
                          softWrap: true,
                        ),
                        Text(
                          course.category,
                          style: context.textTheme.bodyMedium,
                        ),
                        Text(
                          '${course.price} ★ - ${Duration(seconds: course.length).inHours} hours',
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
