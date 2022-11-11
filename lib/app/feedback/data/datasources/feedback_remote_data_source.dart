import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/feedback/domain/entities/feedback.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  final String feedbackUrl = '/feedback';
}

abstract class FeedbackRemoteDataSource extends BaseApi with _Endpoint {
  Future<Either<Failure, bool>> createFeedback(Feedback feedback);
}

class FeedbackRemoteDataSourceImpl extends FeedbackRemoteDataSource {
  @override
  Future<Either<Failure, bool>> createFeedback(Feedback feedback) async {
    try {
      final result = await post(
        feedbackUrl,
        data: feedback.toMap(),
      );

      return Right(result.data);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
