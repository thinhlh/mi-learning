import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessions/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

import '../../../../base/failure.dart';

class NoteEditorPageProvider extends LoadingProvider {
  final LessonRepository _lessonRepository;
  NoteEditorPageProvider(
    this._lessonRepository,
  );
  Future<Either<Failure, bool>> postNote(
      String content, String lessonId, int createdAt) {
    return _lessonRepository.postNote(content, lessonId, createdAt);
  }
}
