part of 'explorer_page_provider.dart';

class ExplorerCategoriesPageProvider extends LoadingProvider {
  final GetCategoriesUseCase _getCategoriesUseCase;

  List<Category> categories = [];

  ExplorerCategoriesPageProvider(this._getCategoriesUseCase);

  Future<Either<Failure, List<Category>>> getCategories() {
    return _getCategoriesUseCase(NoParams()).then(
      (value) => value.fold(
        (l) => Left(l),
        (value) {
          categories = value;
          notifyListeners();
          return Right(value);
        },
      ),
    );
  }
}
