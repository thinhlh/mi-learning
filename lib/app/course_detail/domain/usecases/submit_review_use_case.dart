import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/rating.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class SubmitReviewParams implements Params {
  String courseId;
  String content;
  int rating;

  SubmitReviewParams({
    required this.courseId,
    required this.content,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      "courseId": courseId,
      "content": content,
      "rating": rating,
    };
  }
}

class SubmitReviewUseCase implements BaseUseCase<SubmitReviewParams, Rating> {
  final CourseDetailRepository _courseDetailRepository;

  SubmitReviewUseCase(this._courseDetailRepository);

  @override
  Future<Either<Failure, Rating>> call(SubmitReviewParams params) {
    return _courseDetailRepository.createRating(params);
  }
}
