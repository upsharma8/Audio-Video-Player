import 'package:flutter/material.dart';
import 'audio.dart';
import 'main.dart';
import 'audiocache.dart';

class ListAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      RaisedButton(
          child: Text("Tera Baap Aaya"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Audio(
                        audiourl:
                            'https://github.com/upsharma8/music/raw/master/songs.mp3',
                        imageurl: 'images/terabaap.jpg',
                      )),
            );
          }),
      RaisedButton(
          child: Text("Hawayein"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Audio(
                        audiourl:
                            'https://github.com/upsharma8/music/raw/master/Hawayein.mp3',
                        imageurl: 'images/hawayein.jpg',
                      )),
            );
          }),
      RaisedButton(
          child: Text("Despacito"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CacheAudio(
                  audiourl: 'audios/Despacito.mp3',
                  imageurl: 'images/despacito.jpg',
                ),
              ),
            );
          }),
      RaisedButton(
          child: Text("Zindagi"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CacheAudio(
                  audiourl: 'audios/newsong.mp3',
                  imageurl: 'images/zindagi.jpg',
                ),
              ),
            );
          }),
      RaisedButton(
          child: Text("Song 1"),
          onPressed: () {
            a();
          }),
      RaisedButton(
          child: Text(" Song 2"),
          onPressed: () {
            a();
          }),
      RaisedButton(
          child: Text(" Song 3"),
          onPressed: () {
            a();
          }),
    ]);
  }
}
