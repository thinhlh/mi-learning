import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mi_learning/app/home/presentation/providers/home_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';

class HomePage extends PageLoadingStateless<HomeProvider> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBuilder: ((_, index) {
        switch (index) {
          case 0:
            return DashboardPage();
          case 1:
            return DashboardPage();
          case 2:
            return DashboardPage();
          case 3:
            return DashboardPage();
          default:
            return DashboardPage();
        }
      }),
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.explore)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(icon: Icon(Icons.reorder)),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
