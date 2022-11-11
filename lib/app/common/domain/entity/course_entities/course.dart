import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import 'package:mi_learning/app/common/domain/entity/course_entities/course_rating.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/lessons/lesson.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/section.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/teacher.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final int length;
  final String background;
  final String? icon;
  final double price;
  final String category;
  final bool enrolled;
  final bool saved;
  final Teacher teacher;
  final CourseRating courseRatings;
  final String? currentLesson;
  final List<Section> sections;
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.length,
    required this.background,
    this.icon,
    required this.price,
    required this.category,
    required this.enrolled,
    required this.saved,
    required this.teacher,
    required this.courseRatings,
    this.currentLesson,
    required this.sections,
  });

  Course copyWith({
    String? id,
    String? title,
    String? description,
    int? length,
    String? background,
    String? icon,
    double? price,
    String? category,
    bool? enrolled,
    bool? saved,
    Teacher? teacher,
    CourseRating? courseRatings,
    String? currentLesson,
    List<Section>? sections,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      length: length ?? this.length,
      background: background ?? this.background,
      icon: icon ?? this.icon,
      price: price ?? this.price,
      category: category ?? this.category,
      enrolled: enrolled ?? this.enrolled,
      saved: saved ?? this.saved,
      teacher: teacher ?? this.teacher,
      courseRatings: courseRatings ?? this.courseRatings,
      currentLesson: currentLesson ?? this.currentLesson,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'length': length,
      'background': background,
      'icon': icon,
      'price': price,
      'category': category,
      'enrolled': enrolled,
      'saved': saved,
      'teacher': teacher.toMap(),
      'courseRatings': courseRatings.toMap(),
      'currentLesson': currentLesson,
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      length: map['length']?.toInt() ?? 0,
      background: map['background'] ?? '',
      icon: map['icon'],
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      enrolled: map['enrolled'] ?? false,
      saved: map['saved'] ?? false,
      teacher: Teacher.fromMap(map['teacher']),
      courseRatings: CourseRating.fromMap(map['courseRatings']),
      currentLesson: map['currentLesson'],
      sections:
          List<Section>.from(map['sections']?.map((x) => Section.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, title: $title, description: $description, length: $length, background: $background, icon: $icon, price: $price, category: $category, enrolled: $enrolled, saved: $saved, teacher: $teacher, courseRatings: $courseRatings, currentLesson: $currentLesson, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.length == length &&
        other.background == background &&
        other.icon == icon &&
        other.price == price &&
        other.category == category &&
        other.enrolled == enrolled &&
        other.saved == saved &&
        other.teacher == teacher &&
        other.courseRatings == courseRatings &&
        other.currentLesson == currentLesson &&
        listEquals(other.sections, sections);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        length.hashCode ^
        background.hashCode ^
        icon.hashCode ^
        price.hashCode ^
        category.hashCode ^
        enrolled.hashCode ^
        saved.hashCode ^
        teacher.hashCode ^
        courseRatings.hashCode ^
        currentLesson.hashCode ^
        sections.hashCode;
  }

  int get finishedLessons {
    return lessons.where((element) => element.metadata.finished).length;
  }

  int get finishedLessonOrder {
    int finishedLessonOrder;
    try {
      finishedLessonOrder = sections
          .fold<List<Lesson>>(
            [],
            (previous, section) => previous..addAll(section.lessons),
          )
          .firstWhere(
            (lesson) => lesson.id == currentLesson,
          )
          .lessonOrder;
    } catch (e) {
      finishedLessonOrder = 0;
    }
    return finishedLessonOrder;
  }

  int get totalLesson {
    return sections.fold<List<Lesson>>(
      [],
      (previous, section) => previous..addAll(section.lessons),
    ).length;
  }

  String? get currentLessonTitle {
    String? result;
    try {
      result = sections
          .fold<List<Lesson>>(
            [],
            (previous, section) => previous..addAll(section.lessons),
          )
          .firstWhere(
            (lesson) => lesson.id == currentLesson,
          )
          .title;
      return result;
    } catch (e) {
      return result;
    }
  }

  List<Lesson> get lessons {
    return sections.fold(
      [],
      (previousValue, element) => previousValue
        ..addAll(
          element.lessons,
        ),
    );
  }
}
