part of 'explorer_page.dart';

class _ExplorerCategoriesPage extends StatefulWidget {
  @override
  State<_ExplorerCategoriesPage> createState() =>
      _ExplorerCategoriesPageState();
}

class _ExplorerCategoriesPageState extends PageLoadingStateful<
    ExplorerCategoriesPageProvider,
    _ExplorerCategoriesPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return buildPage(context);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Selector<ExplorerCategoriesPageProvider, List<Category>>(
      selector: (_, provider) => provider.categories,
      builder: (_, categories, child) => GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
          crossAxisSpacing: AppDimens.largeWidthDimens,
          mainAxisSpacing: AppDimens.smallHeightDimens,
        ),
        itemBuilder: (_, index) => CourseCategoryWidget(
          category: categories[index],
        ),
        itemCount: categories.length,
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    provider.getCategories();
  }

  @override
  bool get wantKeepAlive => true;
}
