import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

import '../pages/lesson_question_answer_page.dart';

class LessonQuestionAnswerPageProvider extends LoadingProvider {
  final TextEditingController commentController = TextEditingController();

  List<Comment> comments = [
    Comment(
      name: 'Hoang Thinh',
      content: '',
      subComments: [],
      readOnly: false,
    ),
    Comment(
      name: 'Joshua',
      content: 'How to implement this in real word applications?',
      subComments: [
        Comment(
          name: 'David Corp',
          content: 'Same question.',
          subComments: [],
          readOnly: true,
        ),
      ],
      readOnly: true,
    ),
    Comment(
      name: 'William',
      content: 'Will this course practicable?',
      subComments: [
        Comment(
          name: 'Amy Nash',
          content: 'Absolutely!',
          subComments: [],
          readOnly: true,
        )
      ],
      readOnly: true,
    ),
    Comment(
      name: 'Roger Cast',
      content:
          'Does anyone know how to achieve the question 4 in lecture no.3?',
      subComments: [],
      readOnly: true,
    ),
  ];

  void addComment() {
    final commentCopy = comments;
    commentCopy.insert(
      1,
      Comment(
        name: 'Hoang Thinh',
        content: commentController.text,
        subComments: [],
        readOnly: true,
      ),
    );
    comments = commentCopy;
    notifyListeners();

    commentController.clear();
  }
}
