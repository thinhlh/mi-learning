import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class UpdateLessonFinishedStatusParams implements Params {
  final String lessonId;
  final bool finished;
  UpdateLessonFinishedStatusParams({
    required this.lessonId,
    required this.finished,
  });

  UpdateLessonFinishedStatusParams copyWith({
    String? lessonId,
    bool? finished,
  }) {
    return UpdateLessonFinishedStatusParams(
      lessonId: lessonId ?? this.lessonId,
      finished: finished ?? this.finished,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lessonId': lessonId,
      'finished': finished,
    };
  }

  factory UpdateLessonFinishedStatusParams.fromMap(Map<String, dynamic> map) {
    return UpdateLessonFinishedStatusParams(
      lessonId: map['lessonId'] ?? '',
      finished: map['finished']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateLessonFinishedStatusParams.fromJson(String source) =>
      UpdateLessonFinishedStatusParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'UpdateLessonPlaybackParams(lessonId: $lessonId, finished: $finished)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateLessonFinishedStatusParams &&
        other.lessonId == lessonId &&
        other.finished == finished;
  }

  @override
  int get hashCode => lessonId.hashCode ^ finished.hashCode;
}

class UpdateLessonFinishedUseCase
    implements BaseUseCase<UpdateLessonFinishedStatusParams, bool> {
  final LessonRepository _lessonRepository;

  UpdateLessonFinishedUseCase(this._lessonRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateLessonFinishedStatusParams params) {
    return _lessonRepository.updateLessonFinished(params);
  }
}
