import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'audiolist.dart';
import 'videolist.dart';

void main() {
  runApp(MyApp());
}

a() {
  Fluttertoast.showToast(
      msg: "Not Available",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.greenAccent,
      fontSize: 16.0);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Audio Video Player"),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
            actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: a)],
            leading: Icon(Icons.menu),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'MUSIC ',
                  icon: Icon(Icons.music_note),
                ),
                Tab(
                  text: 'VIDEO',
                  icon: Icon(Icons.music_video),
                )
              ],
              indicatorColor: Colors.amberAccent,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      a();
                    }),
                IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      a();
                    }),
                IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () {
                      a();
                    }),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("images/pic.jpg"),
                      )),
                ),
                ListTile(
                  title: Text("Complete Profile"),
                  onLongPress: () {
                    a();
                  },
                ),
                ListTile(
                  title: Text("Message"),
                  autofocus: true,
                  onTap: () {
                    a();
                  },
                )
              ],
            ),
          ),
          backgroundColor: Colors.amber,
          body: TabBarView(children: [
            ListAudio(),
            listVideo(),
          ]),
        ),
      ),
    );
  }
}
