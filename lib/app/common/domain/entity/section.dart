import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';

class Section {
  final String id;
  final String title;
  final List<Lesson> lessons;
  Section({
    required this.id,
    required this.title,
    required this.lessons,
  });

  Section copyWith({
    String? id,
    String? title,
    List<Lesson>? lessons,
  }) {
    return Section(
      id: id ?? this.id,
      title: title ?? this.title,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'lessons': lessons.map((x) => x.toMap()).toList(),
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      lessons: List<Lesson>.from(map['lessons']?.map((x) => Lesson.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source));

  @override
  String toString() => 'Section(id: $id, title: $title, lessons: $lessons)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Section &&
        other.id == id &&
        other.title == title &&
        listEquals(other.lessons, lessons);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ lessons.hashCode;
}
