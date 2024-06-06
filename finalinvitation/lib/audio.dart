import 'package:just_audio/just_audio.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  final AudioPlayer audioPlayer;

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal() : audioPlayer = AudioPlayer();

  Future<void> loadAndPlay(String soundPath) async {
    await audioPlayer.setAsset('assets/audios/$soundPath');
    audioPlayer.play();
  }

  void stop() {
    audioPlayer.stop();
  }
}
