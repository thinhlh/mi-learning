import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:video_player/video_player.dart';

class WVideoPlayer extends StatefulWidget {
  const WVideoPlayer({Key? key}) : super(key: key);

  @override
  State<WVideoPlayer> createState() => _WVideoPlayerState();
}

class _WVideoPlayerState extends State<WVideoPlayer> {
  late final VideoPlayerController _controller;
  ChewieController? _chewieController;
  late Future<void> _isInitializedVideo;

  Future<void> _initializePlayer() async {
    _controller = VideoPlayerController.network(
      'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/de0e3ee6-e40d-4da3-805b-b0643b4ff351/PC_-_Ht_Cho_Nhng_Ph_Phng_x_NewoulZ.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20220508%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20220508T060306Z&X-Amz-Expires=86400&X-Amz-Signature=c90ef77ec68613f82981cae988ba120c4999cd4c043649b6f6748eb634f4c125&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22PC%2520-%2520H%25C3%25A1t%2520Cho%2520Nh%25E1%25BB%25AFng%2520Ph%25E1%25BB%2591%2520Ph%25C6%25B0%25E1%25BB%259Dng%2520x%2520New%2524oulZ.mp4%22&x-id=GetObject',
    );
    _isInitializedVideo = _controller.initialize();
    await _isInitializedVideo;

    _chewieController = ChewieController(
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
