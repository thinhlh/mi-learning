part of 'lession_page.dart';

class _LessionNotePage extends PageLoadingStateless<LessionNotePageProvider> {
  final BoxConstraints _noteEditorConstraint;
  final _controller = editor.QuillController.basic();

  _LessionNotePage(this._noteEditorConstraint);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.mediumRadius,
            ),
          ),
          constraints: _noteEditorConstraint,
          context: context,
          barrierColor: Colors.transparent,
          builder: (_) => RouteUtil.createPageProvider(
            provider: (_) => NoteEditorProvider(),
            child: NoteEditorPage(editor.QuillController.basic()),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimens.largeWidthDimens),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                ),
                hintText: 'Search notes',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (_, index) => ExpansionTile(
                leading: Container(
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: AppColors.neutral.shade900,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.mediumWidthDimens,
                    vertical: AppDimens.smallHeightDimens,
                  ),
                  child: Text(
                    '1:38',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.neutral.shade50,
                    ),
                  ),
                ),
                title: Text(
                  'This is the note title',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.mediumRadius),
                      color: AppColors.neutral.shade50,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimens.largeWidthDimens,
                      vertical: AppDimens.mediumHeightDimens,
                    ),
                    child: editor.QuillEditor(
                      autoFocus: false,
                      expands: false,
                      focusNode: FocusNode(canRequestFocus: false),
                      // onTapUp: null,
                      onTapDown: (detail, position) {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimens.mediumRadius,
                            ),
                          ),
                          constraints: _noteEditorConstraint,
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (_) => RouteUtil.createPageProvider(
                            provider: (_) => NoteEditorProvider(),
                            child: NoteEditorPage(
                              editor.QuillController.basic(),
                            ),
                          ),
                        );
                        return true;
                      },
                      scrollController: ScrollController(),
                      scrollable: false,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.mediumWidthDimens,
                        vertical: AppDimens.largeHeightDimens,
                      ),
                      controller: _controller,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
