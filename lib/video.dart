import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController video;
  final bool playing;
  Video({this.video, this.playing, Key key}) : super(key: key);

  VideoState createState() => VideoState();
}

class VideoState extends State<Video> {
  ChewieController chewie;

  void initState() {
    super.initState();
    chewie = ChewieController(
      videoPlayerController: widget.video,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.playing,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: Chewie(
        controller: chewie,
      ),
    );
  }
}
