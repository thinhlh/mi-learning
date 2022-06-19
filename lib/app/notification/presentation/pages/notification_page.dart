import 'package:flutter/material.dart';
import 'package:mi_learning/app/notification/presentation/bloc/notification_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class NotificationPage extends PageLoadingStateless<NotificationPageBloc> {
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => navigator.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
        ),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.checklist_rtl,
              color: AppColors.neutral.shade900,
            ),
          )
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (_, index) => const Divider(height: 0),
        itemBuilder: (_, index) => ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: AppDimens.mediumHeightDimens,
            horizontal: AppDimens.mediumWidthDimens,
          ),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.errorText,
                radius: AppDimens.smallRadius,
              ),
              SizedBox(width: AppDimens.mediumWidthDimens),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(
                    'assets/images/medal.png',
                    width: AppDimens.largeRadius,
                  ),
                ),
              ),
            ],
          ),
          selected: true,
          selectedTileColor: AppColors.secondaryLight.withOpacity(0.1),
          title: Text(
            'Midterm examination on Tuesday, Jan 14th',
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            'Remember taking the test as it will account for 50% of your final grade.',
            style: context.textTheme.caption,
          ),
          dense: true,
          trailing: Column(
            children: [
              Text(
                '11/07',
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        itemCount: 100,
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}
}
