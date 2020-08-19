import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CacheAudio extends StatefulWidget {
  final audiourl;
  final imageurl;
  CacheAudio({this.audiourl, this.imageurl, Key key}) : super(key: key);
  StateAudio createState() => StateAudio();
}

class StateAudio extends State<CacheAudio> {
  AudioPlayer play;
  AudioCache player;

  void initState() {
    play = new AudioPlayer();
    player = new AudioCache(fixedPlayer: play);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Music Player"),
          centerTitle: true,
          actions: [Icon(Icons.more_vert)],
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Image.asset(
              widget.imageurl,
              fit: BoxFit.contain,
              height: 300,
              width: 200,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  border: Border.all(color: Colors.greenAccent, width: 5),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () => player.play(widget.audiourl)),
                  IconButton(
                      icon: Icon(Icons.pause), onPressed: () => play.pause()),
                  IconButton(
                      icon: Icon(Icons.stop), onPressed: () => play.stop()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
