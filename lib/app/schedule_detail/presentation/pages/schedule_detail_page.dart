import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule_color.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/schedule_detail_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule_status.dart';
import 'package:provider/provider.dart';

class ScheduleDetailPage
    extends PageLoadingStateless<ScheduleDetailPageProvider> {
  late final Schedule schedule;
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: schedule.color.color,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: null,
        shadowColor: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => navigator.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.isDarkMode
                ? AppColors.neutral.shade500
                : AppColors.neutral.shade900,
          ),
        ),
        title: Text(
          'Schedule Detail',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.largeWidthDimens,
              vertical: AppDimens.largeHeightDimens,
            ),
            child: Text(
              'Test',
              style: context.textTheme.displaySmall?.copyWith(
                color: AppColors.neutral.shade50,
                fontWeight: AppStyles.bold,
              ),
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.largeWidthDimens,
                vertical: AppDimens.largeHeightDimens,
              ),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppColors.neutral.shade500
                    : AppColors.neutral.shade50,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    AppDimens.extraLargeHeightDimens,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule.title,
                      style: context.textTheme.titleLarge,
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    ListTile(
                      leading: const Icon(Icons.access_time_outlined),
                      title: Text(
                        DateTimeHelper.format(
                          schedule.dueDate,
                          format: DateFormat('HH:mm a | dd-MM-yyyy'),
                        ),
                        style: const TextStyle(
                          fontWeight: AppStyles.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.event_note_outlined,
                      ),
                      title: Text(
                        schedule.status.name,
                        style: TextStyle(
                          fontWeight: AppStyles.extraBold,
                          color: schedule.status.color,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(schedule.location),
                    ),
                    ListTile(
                      leading: const Icon(Icons.comment_outlined),
                      title: Text(schedule.note),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    ListTile(
                      onTap: () => navigator
                          .pushNamed(
                            Routes.timerChosen,
                            arguments: 15,
                          )
                          .then(
                            (value) =>
                                provider.currentChosenTimer = value as int,
                          ),
                      leading: const Icon(Icons.av_timer_outlined),
                      title: Selector<ScheduleDetailPageProvider, int>(
                        selector: (_, provider) => provider.currentChosenTimer,
                        shouldRebuild: (oldValue, newValue) =>
                            oldValue != newValue,
                        builder: (_, timer, child) {
                          return Text(
                            'Notify me before | ${timer == 0 ? 'Never' : '$timer minutes'}',
                          );
                        },
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: AppDimens.smallIcon,
                      ),
                    ),
                    SizedBox(height: AppDimens.extraLargeHeightDimens),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          navigator.pushNamed(
                            Routes.quiz,
                          );
                        },
                        child: const Text('Taking your test'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.primarySwatch.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    schedule = context.getArgument();
  }
}
