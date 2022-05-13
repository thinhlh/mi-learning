import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/calendar/presentation/providers/calendar_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends PageLoadingStateless<CalendarProvider> {
  @override
  Widget buildPage(BuildContext context) {
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
          TableCalendar(
            focusedDay: DateTime.now(),
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
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: AppDimens.smallIcon,
                  ),
                  SizedBox(width: 20.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: AppDimens.smallIcon,
                  ),
                ],
              ),
            ),
            headerStyle: HeaderStyle(
              headerPadding: EdgeInsets.only(
                right: AppDimens.largeWidthDimens,
                left: AppDimens.largeWidthDimens,

                // vertical: AppDimens.extraLargeHeightDimens,
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
            // holidayPredicate: (_) => true,
            onDaySelected: (oldDate, newDate) {},
            rangeSelectionMode: RangeSelectionMode.disabled,
            // selectedDayPredicate: (_) => true,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryLight.withOpacity(0.5),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50.r),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                itemBuilder: (_, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.blue,
                    ),
                    title: Text(
                      'This is a deadline',
                    ),
                  );
                },
                itemCount: 100,
              ),
            ),
          ),
          // DraggableScrollableSheet(
          //   controller: DraggableScrollableController(),
          //   expand: true,
          //   // maxChildSize: 0.9,
          //   initialChildSize: 0.5,
          //   builder: (
          //     BuildContext context,
          //     ScrollController scrollController,
          //   ) {
          //     return SingleChildScrollView(
          //       controller: scrollController,
          //       physics: const BouncingScrollPhysics(),
          //       child: Container(
          //         height: 0.3.sh,
          //         decoration: BoxDecoration(
          //           color: AppColors.primarySwatch.shade200.withOpacity(0.8),
          //           borderRadius: const BorderRadius.vertical(
          //             top: Radius.circular(50),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
