import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/calendar/presentation/providers/schedule_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends PageLoadingStateless<SchedulePageProvider> {
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
            // holidayPredicate: (date) => true,
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
            // holidayPredicate: (_) => true,
            onDaySelected: (oldDate, newDate) {},
            rangeSelectionMode: RangeSelectionMode.disabled,
            // selectedDayPredicate: (_)=>true,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => navigator.pushNamed(Routes.scheduleDetail),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppDimens.mediumWidthDimens,
                    vertical: AppDimens.mediumHeightDimens,
                  ),
                  decoration: BoxDecoration(
                    color: [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.red,
                      Colors.brown,
                      Colors.cyan,
                      Colors.grey,
                    ][index % 7]
                        .withOpacity(0.4),
                    borderRadius: BorderRadius.circular(
                      AppDimens.largeRadius,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.largeWidthDimens,
                    vertical: AppDimens.largeHeightDimens,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Positioned.fill(
                                child: Transform.rotate(
                                  angle: pi / 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        AppDimens.largeRadius,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryLight
                                      .withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.largeRadius,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimens.largeHeightDimens,
                                  horizontal: AppDimens.largeWidthDimens,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'AUG',
                                      style: TextStyle(
                                        color: AppColors.neutral.shade100,
                                      ),
                                    ),
                                    Text(
                                      '20',
                                      style: TextStyle(
                                        fontWeight: AppStyles.extraBold,
                                        color: AppColors.neutral.shade50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sun 11:00 AM | Offline',
                                style: TextStyle(
                                  color: AppColors.neutral.shade900,
                                ),
                              ),
                              SizedBox(height: AppDimens.mediumHeightDimens),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.largeWidthDimens,
                                  vertical: AppDimens.mediumHeightDimens,
                                ),
                                decoration: const ShapeDecoration(
                                  color: Colors.black12,
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  'Midterm test',
                                  style: TextStyle(
                                    color: AppColors.neutral.shade50,
                                    fontWeight: AppStyles.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      Text(
                        'How to achieve high performance in Midterm test?',
                        style: context.textTheme.titleLarge?.copyWith(
                          color: AppColors.neutral.shade50,
                          fontWeight: AppStyles.extraBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 100,
            ),
          )
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: AppColors.secondaryLight.withOpacity(0.5),
          //       borderRadius: BorderRadius.vertical(
          //         top: Radius.circular(50.r),
          //       ),
          //     ),
          //     child: ListView.builder(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 50,
          //       ),
          //       itemBuilder: (_, index) {
          //         return const ListTile(
          //           leading: CircleAvatar(
          //             radius: 5,
          //             backgroundColor: Colors.blue,
          //           ),
          //           title: Text(
          //             'This is a deadline',
          //           ),
          //         );
          //       },
          //       itemCount: 100,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
