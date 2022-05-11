import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_page.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_provider.dart';
import 'package:mi_learning/app/home/presentation/providers/home_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/route_util.dart';

class HomePage extends PageLoadingStateless<HomeProvider> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBuilder: ((_, index) {
        switch (index) {
          case 0:
            return RouteUtil.createPageProvider(
              provider: (_) => DashboardProvider(),
              child: DashboardPage(),
            );
          case 1:
            return RouteUtil.createPageProvider(
              provider: (_) => ExplorerProvider(),
              child: ExplorerPage(),
            );
          case 2:
            return GestureDetector(
              onTap: () => FirebaseCrashlytics.instance.crash(),
              child: Center(
                child: Text(
                  'Crash',
                  style: context.textTheme.headlineLarge,
                ),
              ),
            );
          case 3:
            return GestureDetector(
              onTap: () => navigator.pushNamed(Routes.auth),
              child: Center(
                child: Text(
                  'Logout',
                  style: context.textTheme.headlineLarge,
                ),
              ),
            );
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
