import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/lessons/lesson.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LessionPageProvider extends LoadingProvider {
  final LessonGetCourseDetailUseCase _lessonGetCourseDetailUseCase;

  String? courseId;
  Lesson? lesson;
  CourseDetail? _courseDetail;
   int _second = 0;
  int get second => _second;
  set second(int second) {
    _second = second;
    notifyListeners();
  }

  LessionPageProvider(this._lessonGetCourseDetailUseCase);

  CourseDetail? get courseDetail => _courseDetail;

  set courseDetail(CourseDetail? value) {
    _courseDetail = value;
    notifyListeners();
  }

  Future<Either<Failure, CourseDetail>> getCourseDetail() {
    return _lessonGetCourseDetailUseCase(
      LessonGetCourseDetailParams(courseId ?? ""),
    ).then(
      (value) => value.fold(
        (l) => Left(l),
        (value) {
          _courseDetail = value;
          notifyListeners();
          return Right(value);
        },
      ),
    );
  }
}
