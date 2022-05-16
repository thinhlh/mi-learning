import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mi_learning/app/article/presentation/providers/article_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ArticlePage extends PageLoadingStateless<ArticleProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.largeHeightDimens,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Articles',
              style: context.textTheme.titleLarge,
            ),
          ),
          const Expanded(
            child: _ArticleTabBar(),
          )
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}

class _ArticleTabBar extends StatefulWidget {
  const _ArticleTabBar({Key? key}) : super(key: key);

  @override
  State<_ArticleTabBar> createState() => __ArticleTabBarState();
}

class __ArticleTabBarState extends State<_ArticleTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            tabs: const <Tab>[
              Tab(text: 'Flutter'),
              Tab(text: 'Django'),
              Tab(text: 'Redis'),
              Tab(text: 'Architecture'),
              Tab(text: 'Devs & Life'),
              Tab(text: 'Design'),
            ],
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            leading: Image.asset(
              'assets/images/flutter-course.jpeg',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          itemCount: 100,
        ),
      ),
    );
  }
}
