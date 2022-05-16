import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/calendar/presentation/providers/schedule_detail_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';

class ScheduleDetailPage extends PageLoadingStateless<ScheduleDetailProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.4),
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
                      'How to achieve high performace in midterm test?',
                      style: context.textTheme.titleLarge,
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    const ListTile(
                      leading: Icon(Icons.access_time_outlined),
                      title: Text(
                        '10:30 - 11:30',
                        style: TextStyle(
                          fontWeight: AppStyles.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.event_note_outlined,
                      ),
                      title: Text(
                        'Status',
                        style: TextStyle(
                          fontWeight: AppStyles.extraBold,
                          color: AppColors.success,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(
                        'Microsoft Teams - msjkl',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.comment_outlined),
                      title: Text(
                        'Remember to bring your own calculator. We don\'t have any responsibility to resolve your problem during the test.',
                      ),
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
                      title: Selector<ScheduleDetailProvider, int>(
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
                        onPressed: () {},
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
  void initialization(BuildContext context) {}
}
