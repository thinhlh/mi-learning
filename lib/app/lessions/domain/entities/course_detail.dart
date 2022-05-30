import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mi_learning/app/common/domain/entity/lessons/test_lesson.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/video_lesson.dart';

class CourseDetail {
  final String courseId;
  final int length;
  final String currentLesson;
  final List<CourseDetailSection> sections;
  CourseDetail({
    required this.courseId,
    required this.length,
    required this.currentLesson,
    required this.sections,
  });

  CourseDetail copyWith({
    String? courseId,
    int? length,
    String? currentLesson,
    List<CourseDetailSection>? sections,
  }) {
    return CourseDetail(
      courseId: courseId ?? this.courseId,
      length: length ?? this.length,
      currentLesson: currentLesson ?? this.currentLesson,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'length': length,
      'currentLesson': currentLesson,
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseDetail.fromMap(Map<String, dynamic> map) {
    return CourseDetail(
      courseId: map['courseId'] ?? '',
      length: map['length']?.toInt() ?? 0,
      currentLesson: map['currentLesson'] ?? '',
      sections: List<CourseDetailSection>.from(
          map['sections']?.map((x) => CourseDetailSection.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetail.fromJson(String source) =>
      CourseDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseDetail(courseId: $courseId, length: $length, currentLesson: $currentLesson, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseDetail &&
        other.courseId == courseId &&
        other.length == length &&
        other.currentLesson == currentLesson &&
        listEquals(other.sections, sections);
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        length.hashCode ^
        currentLesson.hashCode ^
        sections.hashCode;
  }
}

class CourseDetailSection {
  final String sectionId;
  final String title;
  final int finishedLesson;
  final int length;
  final List<CourseDetailLesson> lessons;
  CourseDetailSection({
    required this.sectionId,
    required this.title,
    required this.finishedLesson,
    required this.length,
    required this.lessons,
  });

  CourseDetailSection copyWith({
    String? sectionId,
    String? title,
    int? finishedLesson,
    int? length,
    List<CourseDetailLesson>? lessons,
  }) {
    return CourseDetailSection(
      sectionId: sectionId ?? this.sectionId,
      title: title ?? this.title,
      finishedLesson: finishedLesson ?? this.finishedLesson,
      length: length ?? this.length,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sectionId': sectionId,
      'title': title,
      'finishedLesson': finishedLesson,
      'length': length,
      'lessons': lessons.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseDetailSection.fromMap(Map<String, dynamic> map) {
    return CourseDetailSection(
      sectionId: map['sectionId'] ?? '',
      title: map['title'] ?? '',
      finishedLesson: map['finishedLesson']?.toInt() ?? 0,
      length: map['length']?.toInt() ?? 0,
      lessons: List<CourseDetailLesson>.from(
          map['lessons']?.map((x) => CourseDetailLesson.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetailSection.fromJson(String source) =>
      CourseDetailSection.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseDetailSection(sectionId: $sectionId, title: $title, finishedLesson: $finishedLesson, length: $length, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseDetailSection &&
        other.sectionId == sectionId &&
        other.title == title &&
        other.finishedLesson == finishedLesson &&
        other.length == length &&
        listEquals(other.lessons, lessons);
  }

  @override
  int get hashCode {
    return sectionId.hashCode ^
        title.hashCode ^
        finishedLesson.hashCode ^
        length.hashCode ^
        lessons.hashCode;
  }
}

class CourseDetailLesson {
  final String lessonId;
  final String title;
  final int lessonOrder;
  final VideoLesson? videoLesson;
  final TestLesson? testLesson;
  final CourseDetailMetaData courseDetailMetaData;
  CourseDetailLesson({
    required this.lessonId,
    required this.title,
    required this.lessonOrder,
    this.videoLesson,
    this.testLesson,
    required this.courseDetailMetaData,
  });

  CourseDetailLesson copyWith({
    String? lessonId,
    String? title,
    int? lessonOrder,
    VideoLesson? videoLesson,
    TestLesson? testLesson,
    CourseDetailMetaData? courseDetailMetaData,
  }) {
    return CourseDetailLesson(
      lessonId: lessonId ?? this.lessonId,
      title: title ?? this.title,
      lessonOrder: lessonOrder ?? this.lessonOrder,
      videoLesson: videoLesson ?? this.videoLesson,
      testLesson: testLesson ?? this.testLesson,
      courseDetailMetaData: courseDetailMetaData ?? this.courseDetailMetaData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': lessonId,
      'title': title,
      'lessonOrder': lessonOrder,
      'videoLesson': videoLesson?.toMap(),
      'testLesson': testLesson?.toMap(),
      'courseDetailMetaData': courseDetailMetaData.toMap(),
    };
  }

  factory CourseDetailLesson.fromMap(Map<String, dynamic> map) {
    return CourseDetailLesson(
      lessonId: map['lessonId'] ?? '',
      title: map['title'] ?? '',
      lessonOrder: map['lessonOrder']?.toInt() ?? 0,
      videoLesson: map['videoLesson'] != null
          ? VideoLesson.fromMap(map['videoLesson'])
          : null,
      testLesson: map['testLesson'] != null
          ? TestLesson.fromMap(map['testLesson'])
          : null,
      courseDetailMetaData: CourseDetailMetaData.fromMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetailLesson.fromJson(String source) =>
      CourseDetailLesson.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseDetailLesson(lessonId: $lessonId, title: $title, lessonOrder: $lessonOrder, videoLesson: $videoLesson, testLesson: $testLesson, courseDetailMetaData: $courseDetailMetaData)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseDetailLesson &&
        other.lessonId == lessonId &&
        other.title == title &&
        other.lessonOrder == lessonOrder &&
        other.videoLesson == videoLesson &&
        other.testLesson == testLesson &&
        other.courseDetailMetaData == courseDetailMetaData;
  }

  @override
  int get hashCode {
    return lessonId.hashCode ^
        title.hashCode ^
        lessonOrder.hashCode ^
        videoLesson.hashCode ^
        testLesson.hashCode ^
        courseDetailMetaData.hashCode;
  }
}

class CourseDetailMetaData {
  final List<CourseDetailNote> notes;
  final bool finished;
  CourseDetailMetaData({
    required this.notes,
    required this.finished,
  });

  CourseDetailMetaData copyWith({
    List<CourseDetailNote>? notes,
    bool? finished,
  }) {
    return CourseDetailMetaData(
      notes: notes ?? this.notes,
      finished: finished ?? this.finished,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'notes': notes.map((x) => x.toMap()).toList(),
      'finished': finished,
    };
  }

  factory CourseDetailMetaData.fromMap(Map<String, dynamic> map) {
    return CourseDetailMetaData(
      notes: List<CourseDetailNote>.from(
          map['notes']?.map((x) => CourseDetailNote.fromMap(x))),
      finished: map['finished'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetailMetaData.fromJson(String source) =>
      CourseDetailMetaData.fromMap(json.decode(source));

  @override
  String toString() =>
      'CourseDetailMetaData(notes: $notes, finished: $finished)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseDetailMetaData &&
        listEquals(other.notes, notes) &&
        other.finished == finished;
  }

  @override
  int get hashCode => notes.hashCode ^ finished.hashCode;
}

class CourseDetailNote {
  final String id;
  final String content;
  final int createdAt;
  CourseDetailNote({
    required this.id,
    required this.content,
    required this.createdAt,
  });

  CourseDetailNote copyWith({
    String? id,
    String? content,
    int? createdAt,
  }) {
    return CourseDetailNote(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt,
    };
  }

  factory CourseDetailNote.fromMap(Map<String, dynamic> map) {
    return CourseDetailNote(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      createdAt: map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetailNote.fromJson(String source) =>
      CourseDetailNote.fromMap(json.decode(source));

  @override
  String toString() =>
      'CourseDetailNote(id: $id, content: $content, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseDetailNote &&
        other.id == id &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode ^ createdAt.hashCode;
}
