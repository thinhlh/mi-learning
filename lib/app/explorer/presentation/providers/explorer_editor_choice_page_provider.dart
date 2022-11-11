part of 'explorer_page_provider.dart';

class ExplorerEditorChoicePageProvider extends LoadingProvider {
  List<Course> _tutorChoiceCourses = [];

  List<Course> get tutorChoiceCourses => _tutorChoiceCourses;

  set tutorChoiceCourses(List<Course> courses) {
    _tutorChoiceCourses = courses;
    notifyListeners();
  }
}
