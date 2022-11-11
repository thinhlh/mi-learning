import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule.dart';
import 'package:mi_learning/app/schedule/presentation/providers/schedule_page_provider.dart';
import 'package:mi_learning/app/schedule/presentation/widgets/schedule_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends PageLoadingStateless<SchedulePageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    PageController _scheduleController = PageController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Schedule',
          style: context.textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Consumer<SchedulePageProvider>(
            builder: (context, provider, child) {
              return TableCalendar(
                onCalendarCreated: ((pageController) {
                  _scheduleController = pageController;
                }),
                focusedDay: provider.selectedDate,
                currentDay: provider.selectedDate,
                firstDay: DateTime.fromMicrosecondsSinceEpoch(0),
                lastDay: DateTime(2100),
                calendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.tetiary,
                    shape: BoxShape.circle,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (_, currentDate) => Row(
                    children: [
                      Text(
                        DateFormat.yMMMM().format(currentDate),
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: AppStyles.extraBold,
                          fontSize: 28.sp,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: AppDimens.smallIcon,
                        ),
                        onTap: () {
                          _scheduleController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuad,
                          );
                        },
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: AppDimens.smallIcon,
                        ),
                        onTap: () {
                          _scheduleController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutQuad,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                holidayPredicate: (date) {
                  return provider.datesHasSchedule
                      .where((element) => date.difference(element).inDays == 0)
                      .isNotEmpty;
                },
                headerStyle: HeaderStyle(
                  headerPadding: EdgeInsets.only(
                    right: AppDimens.largeWidthDimens,
                    left: AppDimens.largeWidthDimens,
                    bottom: AppDimens.largeHeightDimens,
                  ),
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontWeight: AppStyles.bold,
                  ),
                  weekendStyle: TextStyle(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                onDaySelected: (selectedDate, focusedDate) {
                  provider.focusedDate = focusedDate;
                  provider.selectedDate = selectedDate;
                },
                rangeSelectionMode: RangeSelectionMode.disabled,
                // selectedDayPredicate: (_) => true,
              );
            },
          ),
          Expanded(
            child: Selector<SchedulePageProvider, List<Schedule>>(
              selector: (_, provider) => provider.scheduleOfSelectedDate,
              builder: (_, schedules, child) {
                return schedules.isEmpty
                    ? Center(
                        child: Text(
                          'You don\'t have any schedule today.',
                          style: context.textTheme.titleLarge,
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) => ScheduleWidget(
                          schedule: schedules[index],
                        ),
                        itemCount: schedules.length,
                      );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) async {
    super.afterFirstBuild(context);

    // showLoading(context, true);
    await provider.getDatesHasSchedules();
    await provider.getSchedulesOfDate();
    // showLoading(context, false);
  }
}
