part of 'explorer_page.dart';

class _ExplorerCategoriesPage extends StatefulWidget {
  @override
  State<_ExplorerCategoriesPage> createState() =>
      _ExplorerCategoriesPageState();
}

class _ExplorerCategoriesPageState extends PageLoadingStateful<
    ExplorerCategoriesPageBloc,
    _ExplorerCategoriesPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return buildPage(context);
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocConsumer<ExplorerCategoriesPageBloc,
            ExplorerCategoriesPageState>(
        listener: (_, state) {
          if (state is ExplorerCategoriesPageInitialState) {
          } else if (state is ExplorerCategoriesPageLoadingState) {
            showLoading(context, true);
          } else if (state is ExplorerCategoriesPageLoadedState) {
            showLoading(context, false);
          } else if (state is ExplorerCategoriesPageFailedState) {
            showLoading(context, false);
            showDialog(
              context: context,
              builder: (_) => WDialog(
                dialogType: DialogType.error,
                content: state.message,
                onActions: const [],
              ),
            );
          }
        },
        buildWhen: (previousState, currentState) =>
            currentState is ExplorerCategoriesPageInitialState ||
            currentState is ExplorerCategoriesPageLoadedState,
        builder: (_, state) {
          final categories = (state is ExplorerCategoriesPageLoadedState)
              ? state.categories
              : [];
          return RefreshIndicator(
            onRefresh: () async {
              bloc.getCategories();
            },
            child: GridView.builder(
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
        });
  }

  @override
  void beforeBuild(BuildContext context) {}

  @override
  bool get wantKeepAlive => false;
}
