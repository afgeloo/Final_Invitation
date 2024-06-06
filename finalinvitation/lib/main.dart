import 'package:deadwhispers/Pages/MainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

double soundVolume = 100.0;

void main() {
  runApp(FinalInvitation());
}

class FinalInvitation extends StatelessWidget {
  const FinalInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('bgm.mp3', volume: soundVolume);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
      //Angelo's added code
    );
  }
}
