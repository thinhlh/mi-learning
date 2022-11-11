import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mi_learning/app/feedback/domain/entities/feedback.dart';
import 'package:mi_learning/app/feedback/domain/usecases/create_feed_back_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class FeedbackPageProvider extends LoadingProvider {
  final CreateFeedBackUseCase _createFeedBackUseCase;

  FeedbackPageProvider(this._createFeedBackUseCase);

  Future<Either<Failure, bool>> createFeedback(Feedback feedback) async {
    return _createFeedBackUseCase(feedback);
  }

  TextEditingController contentController = TextEditingController();

  int _currentRating = 5;

  int get currentRating => _currentRating;

  set currentRating(int currentRating) {
    _currentRating = currentRating;
    notifyListeners();
  }
}
