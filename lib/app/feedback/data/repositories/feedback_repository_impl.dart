import 'package:mi_learning/app/feedback/data/datasources/feedback_remote_data_source.dart';
import 'package:mi_learning/app/feedback/domain/entities/feedback.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/feedback/domain/repositories/feedback_repository.dart';
import 'package:mi_learning/base/failure.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final FeedbackRemoteDataSource _feedbackRemoteDataSource;

  FeedbackRepositoryImpl(this._feedbackRemoteDataSource);
  @override
  Future<Either<Failure, bool>> createFeedback(Feedback feedback) {
    return _feedbackRemoteDataSource.createFeedback(feedback);
  }
}
