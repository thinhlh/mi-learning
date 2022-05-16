import 'package:flutter/material.dart';
import 'package:mi_learning/app/calendar/presentation/providers/timer_chosen_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class TimerChosenPage extends PageLoadingStateless<TimerChosenProvider> {
  late int timerMinutes;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(timerMinutes),
        ),
        centerTitle: true,
        title: Text(
          'Notify Me Before',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return ListView.separated(
            separatorBuilder: (_, index) => Divider(
              color: AppColors.neutral.shade500,
            ),
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                setState(() {
                  timerMinutes = index * 5;
                });
              },
              title: Text(
                index == 0 ? 'Never' : '${index * 5} minutes',
              ),
              trailing: (timerMinutes / 5 != index)
                  ? null
                  : Icon(
                      Icons.check,
                      color: AppColors.tetiary,
                    ),
            ),
            itemCount: 7,
          );
        },
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    timerMinutes = context.getArgument();
  }
}
