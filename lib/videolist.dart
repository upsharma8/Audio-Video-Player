import 'package:flutter/material.dart';
import 'video.dart';
import 'package:video_player/video_player.dart';

listVideo() {
  var a = ListView(
    children: <Widget>[
      Container(
        child: Video(
          video: VideoPlayerController.network(
              "https://github.com/upsharma8/music/raw/master/coffin.mp4"),
          playing: true,
        ),
        margin: EdgeInsets.all(10),
      ),
      Container(
        child: Video(
          video: VideoPlayerController.asset(
            'video/kalank.mp4',
          ),
          playing: true,
        ),
        margin: EdgeInsets.all(10),
      ),
      Container(
        child: Video(
          video: VideoPlayerController.asset(
            'video/song.mp4',
          ),
          playing: true,
        ),
        margin: EdgeInsets.all(10),
      ),
    ],
  );
  return a;
}
