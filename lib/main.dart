import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  
  List colors = [
    Colors.amber[500],
    Colors.amber[600],
    Colors.amber[700],
    Colors.amber[800],
    Colors.amber[900],
    Colors.blue[500],
    Colors.blue[600],
    Colors.blue[700],
    Colors.blue[800],
    Colors.blue[900],
    Colors.green[500],
    Colors.green[600],
    Colors.green[700],
    Colors.green[800],
    Colors.green[900],
    Colors.orange[500],
    Colors.orange[600],
    Colors.orange[700],
    Colors.orange[800],
    Colors.orange[900],
    Colors.red[500],
    Colors.red[600],
    Colors.red[700],
    Colors.red[800],
    Colors.red[900],
    Colors.cyan[500],
    Colors.cyan[600],
    Colors.cyan[700],
    Colors.cyan[800],
    Colors.cyan[900],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
    Colors.yellow[500],
    Colors.yellow[600],
    Colors.yellow[700],
    Colors.yellow[800],
    Colors.yellow[900],
    Colors.pink[600],
    Colors.pink[700],
    Colors.pink[800],
    Colors.pink[900],
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                child: ListView.builder(
                    itemCount: colors.length,
                    itemBuilder: (context, index) =>
                        itemBuilder(index, context)),
              ),
            ),
          ),
        ));
  }

  Widget itemBuilder(index, context) {
    return keyBuilder(index + 1, colors[index], context);
  }

  Widget keyBuilder(int number, color, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(15)),
          height: percentageSizebyLenght(7, context),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                    CircleAvatar(radius: 20.0, backgroundColor: Colors.white),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: OutlineButton(
                onPressed: () {
                  print(number);
                  soundPlayer("note$number.wav");
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child:
                    CircleAvatar(radius: 20.0, backgroundColor: Colors.white),
              ),
            )
          ])),
    );
  }

  soundPlayer(song) {
    final player = AudioCache();
    player.play(song);
  }

  double percentageSizebyLenght(length, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height * (1 / (length + 1));
  }
}
