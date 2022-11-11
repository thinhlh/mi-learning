import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessons/domain/usecases/create_note_use_case.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

import '../../../../base/failure.dart';

class NoteEditorPageProvider extends LoadingProvider {
  final CreateNoteUseCase _createNoteUseCase;
  NoteEditorPageProvider(
    this._createNoteUseCase,
  );
  Future<Either<Failure, bool>> createOrUpdateNote(
    String content,
    String lessonId,
    int createdAt,
    String? id,
  ) {
    return _createNoteUseCase(
      CreateNoteParams(
        id: id,
        content: content,
        lessonId: lessonId,
        createdAt: createdAt,
      ),
    );
  }
}
