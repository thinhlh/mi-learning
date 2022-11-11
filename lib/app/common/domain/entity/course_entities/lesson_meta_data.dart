import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mi_learning/app/common/domain/entity/course_entities/note.dart';

class LessonMetaData {
  final List<Note> notes;
  final bool finished;
  final int playback;
  LessonMetaData({
    required this.notes,
    required this.finished,
    required this.playback,
  });

  LessonMetaData copyWith({
    List<Note>? notes,
    bool? finished,
    int? playback,
  }) {
    return LessonMetaData(
      notes: notes ?? this.notes,
      finished: finished ?? this.finished,
      playback: playback ?? this.playback,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notes': notes.map((x) => x.toMap()).toList(),
      'finished': finished,
      'playback': playback,
    };
  }

  factory LessonMetaData.fromMap(Map<String, dynamic> map) {
    return LessonMetaData(
      notes: List<Note>.from(map['notes']?.map((x) => Note.fromMap(x))),
      finished: map['finished'] ?? false,
      playback: map['playback']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonMetaData.fromJson(String source) =>
      LessonMetaData.fromMap(json.decode(source));

  @override
  String toString() =>
      'LessonMetaData(notes: $notes, finished: $finished, playback: $playback)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LessonMetaData &&
        listEquals(other.notes, notes) &&
        other.finished == finished &&
        other.playback == playback;
  }

  @override
  int get hashCode => notes.hashCode ^ finished.hashCode ^ playback.hashCode;
}
