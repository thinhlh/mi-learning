import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/article/presentation/providers/article_page_provider.dart';
import 'package:mi_learning/app/article/presentation/providers/article_viewer_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ArticlePage extends PageLoadingStateless<ArticlePageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Articles',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.create,
              color: AppColors.neutral.shade900,
            ),
          ),
        ],
      ),
      body: const _ArticleTabBar(),
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

class __ArticleTabBarState
    extends PageLoadingStateful<ArticlePageProvider, _ArticleTabBar>
    with SingleTickerProviderStateMixin {
  final ItemScrollController listScrollController = ItemScrollController();
  final ItemPositionsListener listItemPositionsListener =
      ItemPositionsListener.create();

  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: provider.topics.length,
      vsync: this,
    );
    listItemPositionsListener.itemPositions.addListener(() {
      _controller
          .animateTo(listItemPositionsListener.itemPositions.value.first.index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return DefaultTabController(
      length: provider.topics.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            onTap: (index) {
              listScrollController.scrollTo(
                index: index,
                duration: const Duration(milliseconds: 300),
              );
            },
            tabs: provider.topics.map((topic) => Tab(text: topic)).toList(),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
          child: ScrollablePositionedList.separated(
            itemPositionsListener: listItemPositionsListener,
            itemScrollController: listScrollController,
            separatorBuilder: (_, index) =>
                SizedBox(height: AppDimens.largeHeightDimens),
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.largeHeightDimens,
              horizontal: AppDimens.largeWidthDimens,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, parentIndex) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.topics[parentIndex],
                  style: context.textTheme.titleSmall?.copyWith(
                    color: AppColors.neutral.shade700,
                  ),
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
                ListView.separated(
                  separatorBuilder: (_, index) =>
                      SizedBox(height: AppDimens.mediumHeightDimens),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => navigator.pushNamed(Routes.articleViewer),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppDimens.mediumRadius,
                              ),
                              child: AspectRatio(
                                aspectRatio: 14 / 9,
                                child: Image.asset(
                                  'assets/images/flutter-course.jpeg',
                                  alignment: Alignment.center,
                                  width: 0.3.sw,
                                  fit: BoxFit.cover,
                                  isAntiAlias: true,
                                ),
                              ),
                            ),
                            SizedBox(width: AppDimens.largeWidthDimens),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'nhancv',
                                    maxLines: 1,
                                    style: context.textTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'An AWS Cloud architecture for web hosting - 3 Tiers',
                                    softWrap: true,
                                    style: context.textTheme.titleSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '1 hours ago',
                                    maxLines: 2,
                                    style: context.textTheme.labelSmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            itemCount: provider.topics.length,
          ),
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
