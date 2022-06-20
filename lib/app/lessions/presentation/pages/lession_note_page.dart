part of 'lesson_page.dart';

class _LessionNotePage extends PageLoadingStateless<LessionNotePageProvider> {
  final double safePadding;
  _LessionNotePage({
    required this.safePadding,
  });

  @override
  Widget buildPage(BuildContext context) {
    final controller = editor.QuillController.basic();
    final currentChosenLessonId = context.read<LessonPageProvider>().lesson?.id;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                  currentChosenLessonId!,
                  context.read<LessonPageProvider>().second,
                  context.read<LessionNotePageProvider>().notes,
                ),
              ),
            ),
          );
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
              selector: (_, lessionProvider) {
                final currentChosenLessonId =
                    context.read<LessonPageProvider>().lesson?.id;
                //     provider.courseDetail!.sections[0].lessons[0]
                //         .courseDetailMetaData.notes[0].content);
                final lessons =
                    (lessionProvider.course?.sections ?? []).fold<List<Lesson>>(
                  <Lesson>[],
                  (prev, secion) => prev..addAll(secion.lessons),
                );

                try {
                  provider.notes = lessons
                      .firstWhere(
                        (lesson) {
                          return lesson == lessionProvider.lesson?.id;
                        },
                      )
                      .metadata
                      .notes;
                  return provider.notes;
                } catch (e) {
                  return [];
                }
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
                          title: Text(
                            notes[index].content,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: AppStyles.bold,
                            ),
                          ),
                          children: [
                            Container(
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
                                // onTapUp: null,
                                onTapDown: (detail, position) {
                                  navigator.pushNamed(Routes.noteEditor);

                                  return true;
                                },
                                scrollController: ScrollController(),
                                scrollable: false,
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.mediumWidthDimens,
                                  vertical: AppDimens.largeHeightDimens,
                                ),
                                controller: controller,

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
