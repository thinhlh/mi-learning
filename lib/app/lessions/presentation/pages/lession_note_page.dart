part of 'lession_page.dart';

class _LessionNotePage extends PageLoadingStateless<LessionNotePageProvider> {
  //   var json = jsonEncode('_controller.document'.toDelta().toJson());

// var myJSON = jsonEncode('{message: hello}');
//   final _controller = editor.QuillController(
//       document: editor.Document.fromJson(jsonDecode('{message: hello}')),
//       selection: TextSelection.collapsed(offset: 0));
  final double safePadding;
  _LessionNotePage({
    required this.safePadding,
  });
  final _controller = editor.QuillController.basic();

  @override
  Widget buildPage(BuildContext context) {
    final controller = editor.QuillController.basic();
    final currentChosenLessonId =
        context.read<LessionPageProvider>().lesson?.id;
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
                    context.read<LessionPageProvider>().second,
                    context.read<LessionNotePageProvider>().notes),
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
            child: Selector<LessionPageProvider, List<CourseDetailNote>>(
              selector: (_, lessionProvider) {
                final currentChosenLessonId =
                    context.read<LessionPageProvider>().lesson?.id;
                // log('lessionId:' + currentChosenLessonId.toString());
                // log('content: ' +
                //     provider.courseDetail!.sections[0].lessons[0]
                //         .courseDetailMetaData.notes[0].content);
                final lessons = lessionProvider.courseDetail?.sections
                        .fold<List<CourseDetailLesson>>(
                      [],
                      (prev, secion) => prev..addAll(secion.lessons),
                    ) ??
                    [];
                // lessons.forEach((e) => print('lessionId: ' + e.lessonId));
                // print('lessionId:' + lessons.toString());

                try {
                  provider.notes = lessons
                      .firstWhere(
                        (lesson) {
                          return lesson.lessonId == lessionProvider.lesson?.id;
                        },
                      )
                      .courseDetailMetaData
                      .notes;
                  return provider.notes;
                } catch (e) {
                  print('error' + e.toString());
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

  @override
  void initialization(BuildContext context) {
    // provider.get().then((value) => showLoading(context, false));
  }
}
