import 'package:deadwhispers/Pages/gameoverscreen.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:just_audio/just_audio.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  JournalState createState() => JournalState();
}

class JournalState extends State<Journal> with SingleTickerProviderStateMixin {
  int tapCount = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    FlameAudio.play('page.mp3', volume: soundVolume);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      tapCount++;
      if (tapCount == 4) {
        FlameAudio.play('jumpscare.mp3', volume: soundVolume);
        Future.delayed(Duration(seconds: 1), () {
          _controller.forward();
        });
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => GameOverScreen(
                      message:
                          'You desperately attempted to escape, but the figure chased you mercilessly. It caught up with you, and its wicked goal was clear as it struck you down, leaving you lifeless in its wake.',
                    )), // Replace with your game over screen widget
          );
        });
      }
    });
  }

  Future<bool> _onWillPop() async {
    // Prevent the default back button behavior
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container();

    if (tapCount == 0) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'The journal details dark rituals and the consequences of meddling with the dead. As you read, the pages seem to bleed, the ink dripping like blood onto your hands.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: Duration(milliseconds: 1000),
      );
    } else if (tapCount == 1) {
      content = Text(
        'The journal details dark rituals and the consequences of meddling with the dead. As you read, the pages seem to bleed, the ink dripping like blood onto your hands.',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    } else if (tapCount == 2) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'You hear distant whispers, feeling a presence behind you. When you turn, you see the figure staring at you with hollow eyes, its gaze filled with malice and warning.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: Duration(milliseconds: 1000),
      );
    } else if (tapCount == 3) {
      content = Text(
        'You hear distant whispers, feeling a presence behind you. When you turn, you see the figure staring at you with hollow eyes, its gaze filled with malice and warning.',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
                image: AssetImage("assets/images/journal.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                if (tapCount < 4)
                  Positioned(
                    top: 250,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: 0.7,
                      child: Container(
                        padding: EdgeInsets.all(19.0),
                        margin: EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: content,
                      ),
                    ),
                  ),
                if (tapCount >= 4)
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value * 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/figure.png'),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
