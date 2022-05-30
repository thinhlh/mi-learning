import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionNotePageProvider extends LoadingProvider {
  List<CourseDetailNote> _notes = [];

  List<CourseDetailNote> get notes => _notes;

  set note(List<CourseDetailNote> value) {
    _notes = value;
    notifyListeners();
  }
}
