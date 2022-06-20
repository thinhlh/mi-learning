import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as editor;
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/lessions/domain/entities/course_detail.dart';
import 'package:mi_learning/app/lessions/presentation/blocs/note_editor_page/note_editor_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/services/dialogs/app_dialog.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class NoteEditorPage extends PageLoadingStateless<NoteEditorPageBloc> {
  final editor.QuillController _controller;
  final String currentChosenLessonId;
  final int createdAt;
  final List<CourseDetailNote> notes;

  NoteEditorPage(
    this._controller,
    this.currentChosenLessonId,
    this.createdAt,
    this.notes, {
    Key? key,
  }) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: context.isDarkMode
                ? AppColors.neutral.shade500
                : AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppDialog.showAppDialog(
                context,
                WDialog(
                  dialogType: DialogType.info,
                  content: 'Are you sure want to delete this note?',
                  onActions: [() {}, () => navigator.pop()],
                  actionStrings: const [
                    'Cancel',
                    'Delete',
                  ],
                  actionTextStyles: [
                    null,
                    context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppStyles.bold,
                      color: AppColors.errorText,
                      letterSpacing: 4,
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.neutral.shade900,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'Create Note',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: AppStyles.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        child: Column(
          children: [
            editor.QuillToolbar.basic(
              onImagePickCallback: (file) async => file.path,
              controller: _controller,
              showCameraButton: true,
              showImageButton: true,
              // multiRowsDisplay: false,
              filePickImpl: (_) async {
                final result = await FilePicker.platform.pickFiles();
                return result?.files.single.path;
              },
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.neutral.shade500,
                  ),
                  borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                ),
                // TODO checkout this Editor because it does not allow user type from keyboard
                // TODO enable swipe up to preview typing content
                child: editor.QuillEditor(
                  scrollController: ScrollController(),
                  scrollable: true,
                  focusNode: FocusNode(),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.mediumWidthDimens,
                    vertical: AppDimens.mediumHeightDimens,
                  ),
                  autoFocus: true,
                  expands: true,
                  controller: _controller,
                  readOnly: false,
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  bloc.createNote(
                    content: _controller.plainTextEditingValue.text,
                    lessonId: currentChosenLessonId,
                    createdAt: createdAt,
                  );

                  // notes.add(
                  //   CourseDetailNote(
                  //     content: _controller.plainTextEditingValue.text,
                  //     createdAt: createdAt,
                  //     id: currentChosenLessonId,
                  //   ),
                  // );
                  showDialog(
                    context: context,
                    builder: (_) => WDialog(
                      dialogType: DialogType.success,
                      content: 'Add Note Success',
                      onActions: [
                        () => navigator.pop(true),
                      ],
                    ),
                  );
                  // result.fold(
                  //   (l) {
                  //     showDialog(
                  //       context: context,
                  //       builder: (_) => WDialog(
                  //         dialogType: DialogType.error,
                  //         content: l.message,
                  //         onActions: [],
                  //       ),
                  //     );
                  //   },
                  // (r) => showDialog(
                  //   context: context,
                  //   builder: (_) => WDialog(
                  //     dialogType: DialogType.success,
                  //     content: 'Purchase Course Success',
                  //     onActions: [
                  //       () => navigator.pop(true),
                  //     ],
                  //   ),
                  // ),
                  // );
                },
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
