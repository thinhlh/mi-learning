part of 'explorer_page_provider.dart';

class ExplorerForYouPageProvider extends LoadingProvider {
  List<Course> _recommendCourses = [];

  List<Course> get recommendCourses => _recommendCourses;

  set recommendCourses(List<Course> value) {
    _recommendCourses = value;
    notifyListeners();
  }
}
