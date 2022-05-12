import 'package:flutter/material.dart';
import 'package:mi_learning/app/calendar/presentation/providers/calendar_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends PageLoadingStateless<CalendarProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule',
          style: context.textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime.fromMicrosecondsSinceEpoch(0),
        lastDay: DateTime(2100),
        calendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(),
        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (_, currentDate) => Center(
            child: Text(
              currentDate.toIso8601String(),
            ),
          ),
        ),
        // holidayPredicate: (_) => true,
        onDaySelected: (oldDate, newDate) {},
        rangeSelectionMode: RangeSelectionMode.disabled,
        selectedDayPredicate: (_) => true,
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
