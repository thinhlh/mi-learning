import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class CreateNoteParams implements Params {
  final String content;
  final String lessonId;
  final int createdAt;
  final String? id;
  CreateNoteParams({
    required this.content,
    required this.lessonId,
    required this.createdAt,
    this.id,
  });

  CreateNoteParams copyWith({
    String? content,
    String? lessonId,
    int? createdAt,
    String? id,
  }) {
    return CreateNoteParams(
      content: content ?? this.content,
      lessonId: lessonId ?? this.lessonId,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'lessonId': lessonId,
      'createdAt': createdAt,
      'id': id,
    };
  }

  factory CreateNoteParams.fromMap(Map<String, dynamic> map) {
    return CreateNoteParams(
      content: map['content'] ?? '',
      lessonId: map['lessonId'] ?? '',
      createdAt: map['createdAt']?.toInt() ?? 0,
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateNoteParams.fromJson(String source) =>
      CreateNoteParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreateNoteParams(content: $content, lessonId: $lessonId, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateNoteParams &&
        other.content == content &&
        other.lessonId == lessonId &&
        other.createdAt == createdAt &&
        other.id == id;
  }

  @override
  int get hashCode {
    return content.hashCode ^
        lessonId.hashCode ^
        createdAt.hashCode ^
        id.hashCode;
  }
}

class CreateNoteUseCase implements BaseUseCase<CreateNoteParams, bool> {
  final LessonRepository _lessonRepository;

  CreateNoteUseCase(this._lessonRepository);

  @override
  Future<Either<Failure, bool>> call(CreateNoteParams params) {
    return _lessonRepository.createNote(params);
  }
}
