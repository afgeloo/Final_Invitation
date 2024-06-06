import 'package:deadwhispers/Pages/gameoverscreen.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:just_audio/just_audio.dart';

class Dimension extends StatefulWidget {
  const Dimension({Key? key}) : super(key: key);

  @override
  DimensionState createState() => DimensionState();
}

class DimensionState extends State<Dimension>
    with SingleTickerProviderStateMixin {
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
    FlameAudio.play('tp.mp3', volume: soundVolume);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      tapCount++;
      if (tapCount == 2) {
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
                          'Despite countless warnings, you stubbornly insisted on investigating a funeral you should have avoided. Even after encountering a mysterious symbol on the ground, you still stepped onto it and sealed your fate. Now, you are trapped in this eerie realm forever, with only the spirits\' whispers to keep you company.',
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
            'You are transported to a surreal landscape, where spirits whisper around you. You see glimpses of your past and future, all twisted and dark.',
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
        'You are transported to a surreal landscape, where spirits whisper around you. You see glimpses of your past and future, all twisted and dark. ',
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
                image: AssetImage("assets/images/dimension.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                if (tapCount < 2)
                  Positioned(
                    bottom: -220,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Image.asset(
                        'assets/images/main.png', // Provide your image path here
                        width: 700, // Adjust width according to your needs
                        height: 700, // Adjust height according to your needs
                      ),
                    ),
                  ),
                if (tapCount < 2)
                  Positioned(
                    top: 550,
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
                if (tapCount >= 2)
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
