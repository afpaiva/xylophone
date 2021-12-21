import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();
    final player = AudioCache(fixedPlayer: audioPlayer);

    Container keys(Color color, int note) {
      return Container(
        width: double.infinity,
        color: color,
        child: TextButton(
          onPressed: () {
            audioPlayer.stop();
            player.play('note$note.wav');
          },
          child: const Text(''),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: keys(Colors.red, 1)),
              Expanded(child: keys(Colors.orange, 2)),
              Expanded(child: keys(Colors.yellow, 3)),
              Expanded(child: keys(Colors.green, 4)),
              Expanded(child: keys(Colors.teal, 5)),
              Expanded(child: keys(Colors.blue, 6)),
              Expanded(child: keys(Colors.purple, 7)),
            ],
          ),
        ),
      ),
    );
  }
}
