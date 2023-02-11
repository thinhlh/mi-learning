// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:mi_learning/app/livestream/presentation/providers/live_stream_page_provider.dart';
// import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
// import 'package:mi_learning/core/env/app_config.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LiveStreamPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _LiveStreamPageState();
// }

// // App state class

// class _LiveStreamPageState
//     extends PageLoadingStateful<LiveStreamPageProvider, LiveStreamPage> {
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   late RtcEngine _engine;

//   // Init the app
//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [
//       Permission.microphone,
//       Permission.camera,
//     ].request();

//     //create the engine
//     _engine = await RtcEngine.create(AppConfig.instance.env.agoraAppId);
//     await _engine.enableVideo();
//     _engine.setEventHandler(
//       RtcEngineEventHandler(
//         onjoinChannelSuccess: (String channel, int uid, int elapsed) {
//           print("local user $uid joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         userJoined: (int uid, int elapsed) {
//           print("remote user $uid joined");
//           setState(() {
//             _remoteUid = uid;
//           });
//         },
//         userOffline: (int uid, UserOfflineReason reason) {
//           print("remote user $uid left channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//       ),
//     );

//     await _engine.joinChannel(
//       AppConfig.instance.env.agoraChannelId,
//       'test-channel',
//       null,
//       0,
//     );
//   }

//   // Display remote user's video
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return RtcRemoteView.SurfaceView(
//         uid: _remoteUid!,
//         channelId: channel,
//       );
//     } else {
//       return Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   // Build UI
//   @override
//   Widget buildPage(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter example app'),
//         ),
//         body: Stack(
//           children: [
//             Center(
//               child: _switch ? _renderRemoteVideo() : _renderLocalPreview(),
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.blue,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _switch = !_switch;
//                     });
//                   },
//                   child: Center(
//                     child:
//                         _switch ? _renderLocalPreview() : _renderRemoteVideo(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void initialization(BuildContext context) {
//     initPlatformState();
//   }
// }
