part of 'explorer_page.dart';

class _ExplorerPremiumPage
    extends PageLoadingStateless<ExplorerPremiumPageBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended for you',
                      style: context.textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.3.sh,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: AppDimens.largeWidthDimens,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => const CourseSquareWidget(),
                  itemCount: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}
}
