import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class CourseDetailDiscussPage
    extends PageLoadingStateless<CourseDetailPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral.shade50,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: AppDimens.largeHeightDimens,
          left: AppDimens.largeWidthDimens,
          right: AppDimens.largeWidthDimens,
        ),
        separatorBuilder: (_, index) => Divider(
          height: 0,
          color: AppColors.neutral.shade500,
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.symmetric(
            vertical: AppDimens.smallHeightDimens,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 0,
            leading: Container(
              padding: EdgeInsets.all(AppDimens.smallWidthDimens),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 1.5,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: AppColors.primary,
                size: 20.r,
              ),
            ),
            title: Text('Discussion No.$index'),
            subtitle: Text(
              '$index openned 11 days ago by venetus',
              maxLines: 1,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
