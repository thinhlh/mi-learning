// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mi_learning/app/common/domain/entity/get_course_type.dart';

class GetCourseParams {
  final GetCourseType type;
  final bool loadSections;
  final bool loadLessons;
  GetCourseParams({
    required this.type,
    this.loadSections = false,
    this.loadLessons = false,
  });

  GetCourseParams copyWith({
    GetCourseType? type,
    bool? loadSections,
    bool? loadLessons,
  }) {
    return GetCourseParams(
      type: type ?? this.type,
      loadSections: loadSections ?? this.loadSections,
      loadLessons: loadLessons ?? this.loadLessons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toString(),
      'loadSections': loadSections,
      'loadLessons': loadLessons,
    };
  }

  factory GetCourseParams.fromMap(Map<String, dynamic> map) {
    return GetCourseParams(
      type: GetCourseType.values.firstWhere((type) => type == map['type']),
      loadSections: map['loadSections'] as bool,
      loadLessons: map['loadLessons'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCourseParams.fromJson(String source) =>
      GetCourseParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GetCourseParams(type: $type, loadSections: $loadSections, loadLessons: $loadLessons)';

  @override
  bool operator ==(covariant GetCourseParams other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.loadSections == loadSections &&
        other.loadLessons == loadLessons;
  }

  @override
  int get hashCode =>
      type.hashCode ^ loadSections.hashCode ^ loadLessons.hashCode;
}
