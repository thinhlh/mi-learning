import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mi_learning/app/common/domain/entity/course_rating.dart';

import 'package:mi_learning/app/common/domain/entity/section.dart';
import 'package:mi_learning/app/common/domain/entity/teacher.dart';

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
  final String? currentLesson;
  final List<Section> sections;
  final bool saved;
  final Teacher teacher;
  final CourseRating courseRatings;
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.length,
    required this.background,
    this.icon,
    this.currentLesson,
    required this.price,
    required this.category,
    required this.enrolled,
    required this.sections,
    required this.teacher,
    required this.saved,
    required this.courseRatings,
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
    String? currentLesson,
    bool? saved,
    List<Section>? sections,
    Teacher? teacher,
    CourseRating? courseRating,
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
      sections: sections ?? this.sections,
      teacher: teacher ?? this.teacher,
      courseRatings: courseRating ?? this.courseRatings,
      saved: saved ?? this.saved,
      currentLesson: currentLesson ?? this.currentLesson,
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
      'sections': sections.map((x) => x.toMap()).toList(),
      'teacher': teacher.toMap(),
      'courseRating': courseRatings.toMap(),
      'saved': saved,
      'currentLesson': currentLesson,
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
      currentLesson: map['currentLesson'],
      saved: map['saved'] ?? false,
      sections:
          List<Section>.from(map['sections']?.map((x) => Section.fromMap(x))),
      teacher: Teacher.fromMap(map['teacher']),
      courseRatings: CourseRating.fromMap(map['courseRatings']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, title: $title, description: $description, length: $length, background: $background, saved: $saved, icon: $icon, price: $price, category: $category, enrolled: $enrolled, currentLesson: $currentLesson, sections: $sections, teacher: $teacher, courseRating: $courseRatings)';
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
        other.currentLesson == currentLesson &&
        other.saved == saved &&
        listEquals(other.sections, sections) &&
        other.teacher == teacher &&
        other.courseRatings == courseRatings;
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
        currentLesson.hashCode ^
        saved.hashCode ^
        sections.hashCode ^
        teacher.hashCode ^
        courseRatings.hashCode;
  }
}
