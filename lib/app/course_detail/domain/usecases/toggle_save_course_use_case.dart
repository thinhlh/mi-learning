import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class ToggleSaveCourseParams implements Params {
  final String courseId;
  final bool saved;
  ToggleSaveCourseParams({
    required this.courseId,
    required this.saved,
  });

  ToggleSaveCourseParams copyWith({
    String? courseId,
    bool? saved,
  }) {
    return ToggleSaveCourseParams(
      courseId: courseId ?? this.courseId,
      saved: saved ?? this.saved,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'saved': saved,
    };
  }

  factory ToggleSaveCourseParams.fromMap(Map<String, dynamic> map) {
    return ToggleSaveCourseParams(
      courseId: map['courseId'] ?? '',
      saved: map['saved'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToggleSaveCourseParams.fromJson(String source) =>
      ToggleSaveCourseParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'ToggleSaveCourseParams(courseId: $courseId, saved: $saved)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToggleSaveCourseParams &&
        other.courseId == courseId &&
        other.saved == saved;
  }

  @override
  int get hashCode => courseId.hashCode ^ saved.hashCode;
}

class ToggleSaveCourseUseCase
    implements BaseUseCase<ToggleSaveCourseParams, bool> {
  final CourseDetailRepository _courseDetailRepository;

  ToggleSaveCourseUseCase(this._courseDetailRepository);

  @override
  Future<Either<Failure, bool>> call(ToggleSaveCourseParams params) {
    return _courseDetailRepository.toggleSaveCourse(params);
  }
}
