import 'package:flutter/material.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/presentation/providers/article_page_provider.dart';
import 'package:mi_learning/app/article/presentation/widgets/article_category_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';

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
    with TickerProviderStateMixin {
  final ItemScrollController listScrollController = ItemScrollController();
  final ItemPositionsListener listItemPositionsListener =
      ItemPositionsListener.create();

  late TabController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Selector<ArticlePageProvider, Map<String, List<Article>>>(
      selector: (_, provider) => provider.articles,
      builder: (context, articles, child) {
        _controller = TabController(
          length: articles.length,
          vsync: this,
        );
        listItemPositionsListener.itemPositions.addListener(
          () {
            _controller.animateTo(
                listItemPositionsListener.itemPositions.value.first.index);
          },
        );

        return articles.isEmpty
            ? Shimmer.fromColors(
                child: _buildBody(articles),
                baseColor: AppColors.baseShimmerColor,
                highlightColor: AppColors.highlightShimmerColor,
              )
            : _buildBody(articles);
      },
    );
  }

  Widget _buildBody(Map<String, List<Article>> articles) {
    return DefaultTabController(
      length: articles.length,
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
            tabs:
                articles.entries.toList().map((e) => Tab(text: e.key)).toList(),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
          child: ScrollablePositionedList.separated(
            itemPositionsListener: listItemPositionsListener,
            itemScrollController: listScrollController,
            separatorBuilder: (_, index) => SizedBox(
              height: AppDimens.largeHeightDimens,
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.largeHeightDimens,
              horizontal: AppDimens.largeWidthDimens,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, parentIndex) => ArticleCategoryWidget(
              parentIndex: parentIndex,
            ),
            itemCount: articles.length,
          ),
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    provider.getArticles().then((value) => showLoading(context, false));
  }
}
