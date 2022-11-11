import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_page_provider.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class WVideoPlayer extends StatefulWidget {
  final String url;
  final int playback;
  WVideoPlayer({
    Key? key,
    required this.url,
    required this.playback,
  }) : super(key: key);

  @override
  State<WVideoPlayer> createState() => _WVideoPlayerState();
}

class _WVideoPlayerState extends State<WVideoPlayer> {
  late final VideoPlayerController _controller;
  ChewieController? _chewieController;
  late Future<void> _isInitializedVideo;

  Future<void> _initializePlayer() async {
    _controller = VideoPlayerController.network(
      // "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      widget.url,
    );

    _isInitializedVideo = _controller.initialize();
    await _isInitializedVideo;

    _chewieController = ChewieController(
      startAt: Duration(seconds: widget.playback),
      placeholder: Container(
        color: AppColors.neutral.shade900,
        height: double.infinity,
        width: double.infinity,
      ),
      subtitleBuilder: (_, subtitle) => Container(
        child: subtitle,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
        ),
        decoration: BoxDecoration(
          color: AppColors.neutral.shade900.withOpacity(0.7),
          borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.smallHeightDimens,
        ),
      ),
      subtitle: Subtitles([
        Subtitle(
          index: 0,
          start: const Duration(seconds: 0),
          end: _controller.value.duration,
          text: Text(
            'This is the video subtitle.',
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle2?.copyWith(
              color: AppColors.neutral.shade50,
            ),
          ),
        )
      ]),
      videoPlayerController: _controller,
      // aspectRatio: 16 / 9,
      allowFullScreen: true,
      allowedScreenSleep: true,
      // autoPlay: true,
      looping: true,
      allowMuting: true,
      showControlsOnInitialize: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
      allowPlaybackSpeedChanging: true,
      optionsTranslation: OptionsTranslation(
        subtitlesButtonText: 'cc',
        cancelButtonText: 'cancel',
        playbackSpeedButtonText: 'playback',
      ),
      // customControls: CupertinoControls(
      //   showPlayButton: true,
      //   iconColor: Colors.white,
      //   backgroundColor: Colors.black,
      // ),
    );
  }

  @override
  void initState() {
    _initializePlayer();

    _controller.addListener(() {
      context.read<LessonPageProvider>().playbackSecond =
          _controller.value.position.inSeconds;
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutral.shade900,
      height: 0.25.sh,
      width: double.infinity,
      child: Center(
        child: FutureBuilder(
          future: _isInitializedVideo,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(
                  'This video is removed. Please visit later',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.neutral.shade50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              } else {
                return Chewie(controller: _chewieController!);
              }
            } else {
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  AppColors.neutral.shade50,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
