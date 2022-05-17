import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/article/presentation/pages/article_page.dart';
import 'package:mi_learning/app/article/presentation/providers/article_provider.dart';
import 'package:mi_learning/app/calendar/presentation/pages/calendar_page.dart';
import 'package:mi_learning/app/calendar/presentation/providers/calendar_provider.dart';
import 'package:mi_learning/app/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_page.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_provider.dart';
import 'package:mi_learning/app/home/presentation/providers/home_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
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
            return RouteUtil.createPageProvider(
              child: CalendarPage(),
              provider: (_) => CalendarProvider(),
            );
          case 3:
            return RouteUtil.createPageProvider(
              child: ArticlePage(),
              provider: (_) => ArticleProvider(),
            );

          default:
            return DashboardPage();
        }
      }),
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.transparent,
        border: Border.all(style: BorderStyle.none),
        // currentIndex: 3,
        // height: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.explore)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(icon: Icon(Icons.article_outlined)),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
