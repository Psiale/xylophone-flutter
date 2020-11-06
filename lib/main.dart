import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: FlatButton(
                onPressed: () {
                  soundPlayer('note2.wav');
                },
                child: Text('Press me'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textBuilder(string) {
    return Text(string);
  }

  soundPlayer(song) {
    final player = AudioCache();
    player.play(song);
  }
}
