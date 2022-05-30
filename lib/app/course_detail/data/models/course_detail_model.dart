import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_rating.dart';
import 'package:mi_learning/app/common/domain/entity/section.dart';
import 'package:mi_learning/app/common/domain/entity/teacher.dart';

class CourseDetailModel extends Course {
  CourseDetailModel({
    required String id,
    required String title,
    required String description,
    required int length,
    required String background,
    required String? icon,
    required double price,
    required String category,
    required bool enrolled,
    required bool saved,
    required List<Section> sections,
    required Teacher teacher,
    required CourseRating courseRatings,
  }) : super(
          id: id,
          title: title,
          description: description,
          length: length,
          background: background,
          icon: icon,
          price: price,
          category: category,
          enrolled: enrolled,
          sections: sections,
          teacher: teacher,
          courseRatings: courseRatings,
          saved: saved,
        );
}
