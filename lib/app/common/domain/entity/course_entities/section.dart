import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';

class Section {
  final String id;
  final String title;
  final List<Lesson> lessons;
  final int finishedLesson;
  final int totalLesson;
  final int length;
  Section({
    required this.id,
    required this.title,
    required this.lessons,
    required this.finishedLesson,
    required this.totalLesson,
    required this.length,
  });

  Section copyWith({
    String? id,
    String? title,
    List<Lesson>? lessons,
    int? finishedLesson,
    int? totalLesson,
    int? length,
  }) {
    return Section(
      id: id ?? this.id,
      title: title ?? this.title,
      lessons: lessons ?? this.lessons,
      finishedLesson: finishedLesson ?? this.finishedLesson,
      totalLesson: totalLesson ?? this.totalLesson,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'lessons': lessons.map((x) => x.toMap()).toList(),
      'finishedLesson': finishedLesson,
      'totalLesson': totalLesson,
      'length': length,
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      lessons: List<Lesson>.from(map['lessons']?.map((x) => Lesson.fromMap(x))),
      finishedLesson: map['finishedLesson']?.toInt() ?? 0,
      totalLesson: map['totalLesson']?.toInt() ?? 0,
      length: map['length']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Section(id: $id, title: $title, lessons: $lessons, finishedLesson: $finishedLesson, totalLesson: $totalLesson, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Section &&
        other.id == id &&
        other.title == title &&
        listEquals(other.lessons, lessons) &&
        other.finishedLesson == finishedLesson &&
        other.totalLesson == totalLesson &&
        other.length == length;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        lessons.hashCode ^
        finishedLesson.hashCode ^
        totalLesson.hashCode ^
        length.hashCode;
  }
}
