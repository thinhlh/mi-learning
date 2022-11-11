part of 'lesson_page.dart';

class _LessonNotePage extends PageLoadingStateless<LessonNotePageProvider> {
  bool showEditorPage(
    BuildContext context,
    editor.QuillController controller, {
    String? noteId,
  }) {
    navigator
        .pushNamed(
      Routes.noteEditor,
      arguments: NoteEditorPushDetailParams(
        controller: controller,
        currentChosenLessonId:
            context.read<LessonPageProvider>().lesson?.id ?? "",
        playbackSecond: context.read<LessonPageProvider>().playbackSecond,
        noteId: noteId,
      ),
    )
        .then((value) async {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showEditorPage(
            context,
            editor.QuillController.basic(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.all(AppDimens.largeWidthDimens),
          //   child: TextField(
          //     onChanged: (value) => value,
          //     decoration: InputDecoration(
          //       isDense: true,
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
          //       ),
          //       hintText: 'Search notes',
          //       suffixIcon: const Icon(Icons.search),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Selector<LessonPageProvider, List<Note>>(
              selector: (_, provider) {
                return provider.course?.lessons.fold<List<Note>>(
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
                        final noteController = notes[index].content.isEmpty
                            ? editor.QuillController.basic()
                            : editor.QuillController(
                                document: editor.Document.fromJson(
                                  jsonDecode(notes[index].content),
                                ),
                                selection:
                                    const TextSelection.collapsed(offset: 0),
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
                            child: Builder(builder: (context) {
                              final lessonContainNote = context
                                  .read<LessonPageProvider>()
                                  .course!
                                  .lessons
                                  .where(
                                    (lesson) => lesson.metadata.notes.any(
                                      (element) =>
                                          element.id == notes[index].id,
                                    ),
                                  )
                                  .toList()
                                  .first;
                              return Text(
                                'Lesson No ${lessonContainNote.lessonOrder + 1} - Note No.${index + 1}',
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: AppStyles.bold,
                                ),
                              );
                            }),
                          ),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.mediumRadius,
                                ),
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
