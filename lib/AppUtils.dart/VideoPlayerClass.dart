import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoApp extends StatefulWidget {
  final double? spinSize;

  const VideoApp({Key? key, this.spinSize = 40.0}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;
  bool? initialize = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller!.play();
        setState(() {
          initialize = true;
        });
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    print('Widget is deactive');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('my-widget-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        debugPrint(
            'onVisibilityChanged ${visibilityInfo.key} is ${visiblePercentage}% visible');
        if (visiblePercentage == 0.0) {
          setState(() {
            _controller!.pause();
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: _controller!.value.isInitialized
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _controller!.value.isPlaying
                              ? _controller!.pause()
                              : _controller!.play();
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.black),
                    ),
            ),
            _controller!.value.isPlaying
                ? SizedBox()
                : !initialize!
                    ? SizedBox()
                    : InkWell(
                        onTap: () {
                          setState(() {
                            _controller!.play();
                          });
                        },
                        child: Center(
                          child: Icon(
                            Icons.play_arrow,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
