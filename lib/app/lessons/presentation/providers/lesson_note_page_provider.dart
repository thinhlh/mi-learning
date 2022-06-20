import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/note.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessonNotePageProvider extends LoadingProvider {
  final Course? courseDetail;
  LessonNotePageProvider({required this.courseDetail});
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  set notes(List<Note> value) {
    _notes = value;
    notifyListeners();
  }
}
