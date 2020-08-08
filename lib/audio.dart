import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio extends StatefulWidget {
  final audiourl;
  final imageurl;

  Audio({this.audiourl, this.imageurl, Key key}) : super(key: key);
  @override
  AudioState createState() => AudioState();
}

class AudioState extends State<Audio> {
  AudioPlayer player = AudioPlayer();
  bool playing = false;

  String currentTime = "00:00";
  String completeTime = "00:00";

  @override
  void initState() {
    super.initState();

    player.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });
    player.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  play() {
    player.play(widget.audiourl);
    if (playing) {
      player.pause();

      setState(() {
        playing = false;
      });
    } else {
      player.resume();

      setState(() {
        playing = true;
      });
    }
  }

  stop() {
    player.stop();
    setState(() {
      playing = false;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Music Player"),
        ),
        body: Column(
          children: [
            Image.asset(
              widget.imageurl,
              fit: BoxFit.contain,
              height: 400,
              width: 200,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.greenAccent, width: 5),
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                          onPressed: play),
                      IconButton(icon: Icon(Icons.stop), onPressed: stop),
                      Text(currentTime),
                      Text("|"),
                      Text(completeTime),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
