import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/feedback/domain/entities/feedback.dart';
import 'package:mi_learning/base/failure.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, bool>> createFeedback(Feedback feedback);
}
