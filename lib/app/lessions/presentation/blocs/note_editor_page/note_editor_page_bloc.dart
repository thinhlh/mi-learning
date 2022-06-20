import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/lessions/domain/repositories/lesson_repository.dart';

part 'note_editor_page_event.dart';
part 'note_editor_page_state.dart';

class NoteEditorPageBloc
    extends Bloc<NoteEditorPageEvent, NoteEditorPageState> {
  final LessonRepository _lessonRepository;

  NoteEditorPageBloc(this._lessonRepository) : super(NoteEditorPageInitial()) {
    on<NoteEditorPageCreateNoteEvent>((event, emit) async {
      _lessonRepository.postNote(
        event.content,
        event.lessonId,
        event.createdAt,
      );
    });
  }

  void createNote(
          {required String content,
          required String lessonId,
          required int createdAt}) =>
      add(
        NoteEditorPageCreateNoteEvent(
          content: content,
          lessonId: lessonId,
          createdAt: createdAt,
        ),
      );
}
