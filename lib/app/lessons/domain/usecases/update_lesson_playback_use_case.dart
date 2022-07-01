import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class UpdateLessonPlaybackParams implements Params {
  final String lessonId;
  final int playback;
  UpdateLessonPlaybackParams({
    required this.lessonId,
    required this.playback,
  });

  UpdateLessonPlaybackParams copyWith({
    String? lessonId,
    int? playback,
  }) {
    return UpdateLessonPlaybackParams(
      lessonId: lessonId ?? this.lessonId,
      playback: playback ?? this.playback,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lessonId': lessonId,
      'playback': playback,
    };
  }

  factory UpdateLessonPlaybackParams.fromMap(Map<String, dynamic> map) {
    return UpdateLessonPlaybackParams(
      lessonId: map['lessonId'] ?? '',
      playback: map['playback']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateLessonPlaybackParams.fromJson(String source) =>
      UpdateLessonPlaybackParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'UpdateLessonPlaybackParams(lessonId: $lessonId, playback: $playback)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateLessonPlaybackParams &&
        other.lessonId == lessonId &&
        other.playback == playback;
  }

  @override
  int get hashCode => lessonId.hashCode ^ playback.hashCode;
}

class UpdateLessonPlaybackUseCase
    implements BaseUseCase<UpdateLessonPlaybackParams, bool> {
  final LessonRepository _lessonRepository;

  UpdateLessonPlaybackUseCase(this._lessonRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateLessonPlaybackParams params) {
    throw _lessonRepository.updateLessonPlayback(params);
  }
}
