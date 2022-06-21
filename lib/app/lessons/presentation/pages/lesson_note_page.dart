part of 'lesson_page.dart';

class _LessonNotePage extends PageLoadingStateless<LessonNotePageProvider> {
  final double safePadding;
  _LessonNotePage({
    required this.safePadding,
  });

  bool showEditorPage(
    BuildContext context,
    editor.QuillController controller, {
    String? noteId,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.mediumRadius,
        ),
      ),
      useRootNavigator: true,
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) => RouteUtil.createPageProvider(
        provider: (_) => NoteEditorPageProvider(GetIt.I()),
        child: Padding(
          padding: EdgeInsets.only(top: safePadding),
          child: NoteEditorPage(
            controller,
            context.read<LessonPageProvider>().lesson?.id ?? "",
            context.read<LessonPageProvider>().playbackSecond,
            noteId: noteId,
          ),
        ),
      ),
    ).then<Note?>((value) async {
      if (value != null) {
        showLoading(context, true);

        await context.read<LessonPageProvider>().getCourseDetail();

        showLoading(context, false);
      }
    });

    return true;
  }

  @override
  Widget buildPage(BuildContext context) {
    final controller = editor.QuillController.basic();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showEditorPage(context, controller);
        },
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
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Selector<LessonPageProvider, List<Note>>(
              selector: (_, provider) {
                return provider.course?.sections.fold<List<Lesson>>(
                      [],
                      (previousValue, element) =>
                          previousValue..addAll(element.lessons),
                    ).fold<List<Note>>(
                      [],
                      (previousValue, element) =>
                          previousValue..addAll(element.metadata.notes),
                    ).toList() ??
                    [];
              },
              builder: (_, notes, child) => notes.isEmpty
                  ? Center(
                      child: Text(
                        'You don\'t have any note',
                        style: context.textTheme.titleLarge,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final noteController = editor.QuillController(
                          document: editor.Document.fromJson(
                            jsonDecode(notes[index].content),
                          ),
                          selection: const TextSelection.collapsed(offset: 0),
                        );

                        return ExpansionTile(
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
                              DateTimeHelper.formatDuration(
                                Duration(
                                  seconds: notes[index].createdAt,
                                ),
                              ),
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.neutral.shade50,
                              ),
                            ),
                          ),
                          title: Center(
                            child: Text(
                              'Note No.${index + 1}',
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: AppStyles.bold,
                              ),
                            ),
                          ),
                          children: [
                            GestureDetector(
                              onTap: () => showEditorPage(context, controller),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.mediumRadius),
                                  color: AppColors.neutral.shade50,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: AppDimens.largeWidthDimens,
                                  vertical: AppDimens.mediumHeightDimens,
                                ),
                                child: editor.QuillEditor(
                                  autoFocus: true,
                                  expands: false,
                                  focusNode: FocusNode(canRequestFocus: true),
                                  scrollController: ScrollController(),
                                  scrollable: false,
                                  onTapDown: (_, __) => showEditorPage(
                                    context,
                                    noteController,
                                    noteId: notes[index].id,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.mediumWidthDimens,
                                    vertical: AppDimens.largeHeightDimens,
                                  ),
                                  controller: noteController,
                                  readOnly: false,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: notes.length,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
