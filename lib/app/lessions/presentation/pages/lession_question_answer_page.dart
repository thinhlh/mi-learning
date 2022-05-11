import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as editor;
import 'package:mi_learning/app/lessions/presentation/providers/lession_question_answer_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class LessionQuestionAnswerPage
    extends PageLoadingStateless<LessionQuestionAnswerProvider> {
  final editor.QuillController controller = editor.QuillController.basic();

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        itemBuilder: (_, index) => Comment(
          subComments: index == 0
              ? []
              : [
                  Comment(
                    subComments: const <Comment>[],
                    readOnly: true,
                  ),
                ],
          readOnly: index != 0,
        ),
        itemCount: 20 + 1,
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}

class Comment extends StatelessWidget {
  final List<Comment> subComments;
  final bool readOnly;

  Comment({
    Key? key,
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
                  'Reso Coder',
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
                            child: TextField(),
                          ),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          GestureDetector(
                            child: Icon(
                              Icons.send,
                              size: AppDimens.mediumIcon,
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(AppDimens.smallRadius),
                  color: Colors.white,
                  child: Text('This is a comment'),
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
