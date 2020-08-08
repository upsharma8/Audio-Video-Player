import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CacheAudio extends StatefulWidget {
  final audiourl;
  final imageurl;
  CacheAudio({this.audiourl, this.imageurl, Key key}) : super(key: key);
  StateAudio createState() => StateAudio();
}

class StateAudio extends State<CacheAudio> {
  String mp3Uri = '';
  AudioPlayer player = AudioPlayer();
  void _playSound() {
    player.play(mp3Uri);
    //
  }

  void _loadSound() async {
    final ByteData data = await rootBundle.load(widget.audiourl);
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/Despacito.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
  }

  void initState() {
    super.initState();
    _loadSound();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Music Plaer"),
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
                      onPressed: () => _playSound()),
                  IconButton(
                      icon: Icon(Icons.pause), onPressed: () => player.pause()),
                  IconButton(
                      icon: Icon(Icons.stop), onPressed: () => player.stop()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
