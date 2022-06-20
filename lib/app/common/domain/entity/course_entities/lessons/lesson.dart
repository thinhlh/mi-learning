import 'dart:convert';

import 'package:mi_learning/app/common/domain/entity/course_entities/lesson_meta_data.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/test_lesson.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/video_lesson.dart';

class Lesson {
  final String id;
  final int lessonOrder;
  final String title;
  final VideoLesson? videoLesson;
  final TestLesson? testLesson;
  final LessonMetaData metadata;
  Lesson({
    required this.id,
    required this.lessonOrder,
    required this.title,
    this.videoLesson,
    this.testLesson,
    required this.metadata,
  });

  Lesson copyWith({
    String? id,
    int? lessonOrder,
    String? title,
    VideoLesson? videoLesson,
    TestLesson? testLesson,
    LessonMetaData? metadata,
  }) {
    return Lesson(
      id: id ?? this.id,
      lessonOrder: lessonOrder ?? this.lessonOrder,
      title: title ?? this.title,
      videoLesson: videoLesson ?? this.videoLesson,
      testLesson: testLesson ?? this.testLesson,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lessonOrder': lessonOrder,
      'title': title,
      'videoLesson': videoLesson?.toMap(),
      'testLesson': testLesson?.toMap(),
      'metadata': metadata.toMap(),
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'] ?? '',
      lessonOrder: map['lessonOrder']?.toInt() ?? 0,
      title: map['title'] ?? '',
      videoLesson: map['videoLesson'] != null
          ? VideoLesson.fromMap(map['videoLesson'])
          : null,
      testLesson: map['testLesson'] != null
          ? TestLesson.fromMap(map['testLesson'])
          : null,
      metadata: LessonMetaData.fromMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lesson(id: $id, lessonOrder: $lessonOrder, title: $title, videoLesson: $videoLesson, testLesson: $testLesson, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        other.id == id &&
        other.lessonOrder == lessonOrder &&
        other.title == title &&
        other.videoLesson == videoLesson &&
        other.testLesson == testLesson &&
        other.metadata == metadata;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lessonOrder.hashCode ^
        title.hashCode ^
        videoLesson.hashCode ^
        testLesson.hashCode ^
        metadata.hashCode;
  }
}
