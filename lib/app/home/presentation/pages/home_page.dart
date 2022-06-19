import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/blocs/article_page/article_page_bloc.dart';
import 'package:mi_learning/app/article/presentation/pages/article_page.dart';
import 'package:mi_learning/app/dashboard/presentation/bloc/dashboard_page_bloc.dart';
import 'package:mi_learning/app/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_page/explorer_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_page.dart';
import 'package:mi_learning/app/home/presentation/bloc/home_page_bloc.dart';
import 'package:mi_learning/app/schedule/presentation/bloc/schedule_page_bloc.dart';
import 'package:mi_learning/app/schedule/presentation/pages/schedule_page.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/utils/route_util.dart';

class HomePage extends PageLoadingStateless<HomePageBloc> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return CupertinoTabScaffold(
      controller: bloc.tabController,
      resizeToAvoidBottomInset: false,
      tabBuilder: ((_, index) {
        switch (index) {
          case 0:
            return RouteUtil.createPageBloc(
              bloc: (_) => DashboardPageBloc(
                GetIt.I(),
                GetIt.I(),
                GetIt.I(),
              ),
              child: const DashboardPage(),
            );
          case 1:
            return RouteUtil.createPageBloc<ExplorerPageBloc>(
              bloc: (_) => ExplorerPageBloc(GetIt.I()),
              child: ExplorerPage(),
            );
          case 2:
            return RouteUtil.createPageBloc(
              child: SchedulePage(),
              bloc: (_) => SchedulePageBloc(
                GetIt.I(),
                GetIt.I(),
              ),
            );
          case 3:
            return RouteUtil.createPageBloc(
              child: ArticlePage(),
              bloc: (_) => ArticlePageBloc(GetIt.I()),
            );

          default:
            return const DashboardPage();
        }
      }),
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.transparent,
        border: Border.all(style: BorderStyle.none),
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
  void beforeBuild(BuildContext context) {}
}
