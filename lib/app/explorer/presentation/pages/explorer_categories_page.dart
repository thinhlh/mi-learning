part of 'explorer_page.dart';

class _ExplorerCategoriesPage
    extends PageLoadingStateless<ExplorerCategoriesPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
        vertical: AppDimens.largeHeightDimens,
      ),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimens.largeWidthDimens,
        childAspectRatio: 1 / 1.3,
        mainAxisSpacing: AppDimens.smallHeightDimens,
      ),
      itemBuilder: (_, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimens.largeRadius,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                'assets/images/flutter-course.jpeg',
                isAntiAlias: true,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            'Development',
            style: context.textTheme.titleLarge,
          )
        ],
      ),
      itemCount: 10,
    );
  }

  @override
  void initialization(BuildContext context) {}
}
