import 'package:deadwhispers/Pages/MainMenu.dart';
import 'package:deadwhispers/audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:just_audio/just_audio.dart';

class GameOverScreen extends StatefulWidget {
  final String message;

  const GameOverScreen({Key? key, required this.message}) : super(key: key);

  @override
  _GameOverScreenState createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  final AudioManager audioManager = AudioManager();
  late AudioPlayer audioPlayer;
  int tapCount = 0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void _handleTap() {
    setState(() {
      tapCount++;
      if (tapCount == 2) {
        stopBackgroundMusic();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainMenu()), // Replace with your game over screen widget
        );
      }
    });
  }

  Future<bool> _onWillPop() async {
    // Prevent the default back button behavior
    return false;
  }

  void stopBackgroundMusic() {
    audioManager.stop();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container();

    if (tapCount == 0) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            widget.message,
            textStyle: GoogleFonts.mansalva(
              fontSize: 20,
              color: Color(0xff3b3b3b),
            ),
            speed: Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: Duration(milliseconds: 1000),
      );
    } else if (tapCount == 1) {
      content = Text(
        widget.message,
        style: GoogleFonts.mansalva(
          fontSize: 20,
          color: Color(0xff3b3b3b),
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: GestureDetector(
          onTap: _handleTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/gameover.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                if (tapCount < 2)
                  Positioned(
                    top: 300,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(19.0),
                      margin: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: content,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
