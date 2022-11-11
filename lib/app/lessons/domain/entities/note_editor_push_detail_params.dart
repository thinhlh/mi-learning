import 'package:flutter_quill/flutter_quill.dart';

class NoteEditorPushDetailParams {
  final QuillController controller;
  final String currentChosenLessonId;
  final int playbackSecond;
  final String? noteId;
  NoteEditorPushDetailParams({
    required this.controller,
    required this.currentChosenLessonId,
    required this.playbackSecond,
    this.noteId,
  });

  NoteEditorPushDetailParams copyWith({
    QuillController? controller,
    String? currentChosenLessonId,
    int? playbackSecond,
    String? noteId,
  }) {
    return NoteEditorPushDetailParams(
      controller: controller ?? this.controller,
      currentChosenLessonId:
          currentChosenLessonId ?? this.currentChosenLessonId,
      playbackSecond: playbackSecond ?? this.playbackSecond,
      noteId: noteId ?? this.noteId,
    );
  }

  @override
  String toString() {
    return 'NoteEditorPushDetailParams(controller: $controller, currentChosenLessonId: $currentChosenLessonId, playbackSecond: $playbackSecond, noteId: $noteId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteEditorPushDetailParams &&
        other.controller == controller &&
        other.currentChosenLessonId == currentChosenLessonId &&
        other.playbackSecond == playbackSecond &&
        other.noteId == noteId;
  }

  @override
  int get hashCode {
    return controller.hashCode ^
        currentChosenLessonId.hashCode ^
        playbackSecond.hashCode ^
        noteId.hashCode;
  }
}
