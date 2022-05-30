import 'dart:convert';

import 'package:mi_learning/app/common/domain/entity/lessons/test_lesson.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/video_lesson.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';

class Lesson {
  final String id;
  final int lessonOrder;
  final String title;
  final VideoLesson? videoLesson;
  final TestLesson? testLesson;
  Lesson({
    required this.id,
    required this.lessonOrder,
    required this.title,
    this.videoLesson,
    this.testLesson,
  });

  Lesson copyWith({
    String? id,
    int? lessonOrder,
    String? title,
    VideoLesson? videoLesson,
    TestLesson? testLesson,
  }) {
    return Lesson(
      id: id ?? this.id,
      lessonOrder: lessonOrder ?? this.lessonOrder,
      title: title ?? this.title,
      videoLesson: videoLesson ?? this.videoLesson,
      testLesson: testLesson ?? this.testLesson,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lessonOrder': lessonOrder,
      'title': title,
      'videoLesson': videoLesson?.toMap(),
      'testLesson': testLesson?.toMap(),
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'] ?? '',
      lessonOrder: map['lessonOrder']?.toInt(),
      title: map['title'] ?? '',
      videoLesson: map['videoLesson'] != null
          ? VideoLesson.fromMap(map['videoLesson'])
          : null,
      testLesson: map['testLesson'] != null
          ? TestLesson.fromMap(map['testLesson'])
          : null,
    );
  }

  factory Lesson.fromCourseDetailLesson(CourseDetailLesson lesson) {
    return Lesson.fromMap(lesson.toMap());
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lesson(id: $id, lessonOrder: $lessonOrder, title: $title, videoLesson: $videoLesson, testLesson: $testLesson)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        other.id == id &&
        other.lessonOrder == lessonOrder &&
        other.title == title &&
        other.videoLesson == videoLesson &&
        other.testLesson == testLesson;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lessonOrder.hashCode ^
        title.hashCode ^
        videoLesson.hashCode ^
        testLesson.hashCode;
  }
}
