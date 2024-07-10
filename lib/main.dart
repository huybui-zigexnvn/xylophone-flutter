import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  List<Widget> keyBoard() {
    var mapKeys = {
      Colors.red: 1,
      Colors.orange: 2,
      Colors.yellow: 3,
      Colors.green: 4,
      Colors.teal: 5,
      Colors.blue: 6,
      Colors.purple: 7
    };
    return mapKeys.entries.map((entry) {
      // entry.key là tên màu, entry.value là số tương ứng
      return Expanded(
        child: TextButton(
          onPressed: () {
            PlayMusic(entry.value);
          },
          child: Container(
            color: entry.key,
          ),
        ),
      );
    }).toList();
  }

  void PlayMusic(int number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.wav'));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: keyBoard(),
        ))),
      ),
    );
  }
}
