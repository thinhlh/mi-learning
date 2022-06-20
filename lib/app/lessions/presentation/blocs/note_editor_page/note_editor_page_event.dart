part of 'note_editor_page_bloc.dart';

abstract class NoteEditorPageEvent extends Equatable {
  const NoteEditorPageEvent();

  @override
  List<Object> get props => [];
}

class NoteEditorPageCreateNoteEvent extends NoteEditorPageEvent {
  final String content;
  final String lessonId;
  final int createdAt;

  NoteEditorPageCreateNoteEvent({
    required this.content,
    required this.lessonId,
    required this.createdAt,
  });
}
