import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/pages/article_page.dart';
import 'package:mi_learning/app/article/presentation/providers/article_page_provider.dart';
import 'package:mi_learning/app/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mi_learning/app/dashboard/presentation/providers/dashboard_page_provider.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_page.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_page_provider.dart';
import 'package:mi_learning/app/home/presentation/providers/home_page_provider.dart';
import 'package:mi_learning/app/schedule/presentation/pages/schedule_page.dart';
import 'package:mi_learning/app/schedule/presentation/providers/schedule_page_provider.dart';
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
              provider: (_) => DashboardPageProvider(
                GetIt.I(),
                GetIt.I(),
              ),
              child: DashboardPage(),
            );
          case 1:
            return RouteUtil.createPageProvider(
              provider: (_) => ExplorerPageProvider(),
              child: ExplorerPage(),
            );
          case 2:
            return RouteUtil.createPageProvider(
              child: SchedulePage(),
              provider: (_) => SchedulePageProvider(
                GetIt.I(),
                GetIt.I(),
              ),
            );
          case 3:
            return RouteUtil.createPageProvider(
              child: ArticlePage(),
              provider: (_) => ArticlePageProvider(GetIt.I()),
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
