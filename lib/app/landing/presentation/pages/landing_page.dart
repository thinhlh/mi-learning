import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/landing/presentation/providers/landing_provider.dart';
import 'package:mi_learning/app/lessions/presentation/widgets/w_video_player.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:video_player/video_player.dart';

class LandingPage extends PageLoadingStateless<LandingProvider> {
  final VideoPlayerController controller = VideoPlayerController.asset(
      'assets/videos/course-app.mp4',
      videoPlayerOptions: VideoPlayerOptions());

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade200,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WVideoPlayer(),
          SizedBox(height: AppDimens.largeHeightDimens),
          Text(
            'Become the best in your industry on the learning journey!',
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.neutral.shade50,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}

class SimpleVideoPlayer extends StatefulWidget {
  const SimpleVideoPlayer({Key? key}) : super(key: key);

  @override
  State<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
}

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  final VideoPlayerController _controller = VideoPlayerController.asset(
    'assets/videos/course-app.mp4',
  );
  late final ChewieController _chewieController;

  late final Future<void> _initializeVideo;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      autoInitialize: true,
    );

    _initializeVideo = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: FutureBuilder(
          future: _initializeVideo,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: Chewie(
                  controller: _chewieController,
                ),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
