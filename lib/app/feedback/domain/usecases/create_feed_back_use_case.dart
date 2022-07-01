import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/feedback/domain/entities/feedback.dart';
import 'package:mi_learning/app/feedback/domain/repositories/feedback_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/failure.dart';

class CreateFeedBackUseCase implements BaseUseCase<Feedback, bool> {
  final FeedbackRepository _feedbackRepository;

  CreateFeedBackUseCase(this._feedbackRepository);

  @override
  Future<Either<Failure, bool>> call(Feedback params) {
    return _feedbackRepository.createFeedback(params);
  }
}
