import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as editor;
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/lessions/presentation/providers/note_editor_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class NoteEditorPage extends PageLoadingStateless<NoteEditorProvider> {
  late final editor.QuillController _controller;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: context.isDarkMode
              ? AppColors.neutral.shade200
              : AppColors.neutral.shade900,
        ),
        actions: [
          IconButton(
            onPressed: () {
              provider.showDialog(
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
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {
    _controller = context.getArgument<editor.QuillController>() ??
        editor.QuillController.basic();
  }
}
