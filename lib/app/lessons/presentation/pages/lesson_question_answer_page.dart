import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as editor;
import 'package:mi_learning/app/lessons/presentation/providers/lesson_question_answer_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class LessonQuestionAnswerPage
    extends PageLoadingStateless<LessonQuestionAnswerPageProvider> {
  final editor.QuillController controller = editor.QuillController.basic();

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Questions & Answers',
          style: context.textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
        child: Selector<LessonQuestionAnswerPageProvider, List<Comment>>(
          selector: (_, provider) => provider.comments,
          builder: (_, comments, child) => ListView.builder(
            addAutomaticKeepAlives: true,
            shrinkWrap: true,
            itemBuilder: (_, index) => comments[index],
            itemCount: comments.length,
          ),
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String name;
  final String content;
  final List<Comment> subComments;
  bool readOnly;

  Comment({
    Key? key,
    required this.name,
    required this.content,
    required this.subComments,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/user-avatar-${Random().nextInt(4) + 1}.jpg',
            ),
          ),
          SizedBox(width: AppDimens.largeWidthDimens),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
                readOnly
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          Expanded(
                            child: TextField(
                              maxLines: null,
                              controller: context
                                  .read<LessonQuestionAnswerPageProvider>()
                                  .commentController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.mediumRadius,
                                  ),
                                ),
                                hintText: 'Enter your question...',
                                fillColor: AppColors.neutral.shade50,
                                filled: true,
                              ),
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          GestureDetector(
                            onTap: () => context
                                .read<LessonQuestionAnswerPageProvider>()
                                .addComment(),
                            child: Icon(
                              Icons.send,
                              size: AppDimens.mediumIcon,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                !readOnly
                    ? const SizedBox.shrink()
                    : Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(
                          AppDimens.mediumRadius,
                        ),
                        color: Colors.white,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.mediumWidthDimens,
                            vertical: AppDimens.largeHeightDimens,
                          ),
                          child: Text(
                            content,
                            style: context.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimens.mediumHeightDimens,
                    horizontal: AppDimens.mediumWidthDimens,
                  ),
                  child: Visibility(
                    visible: readOnly,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Like',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: AppStyles.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimens.largeWidthDimens),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Reply',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: AppStyles.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimens.largeWidthDimens),
                        Expanded(
                          child: Text(
                            '14:25 02/04/2022',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodySmall?.copyWith(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => subComments[index],
                  itemCount: subComments.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
