import 'package:deadwhispers/Pages/Act1/Gameplay1BBBA.dart';
import 'package:deadwhispers/Pages/Act1/Gameplay1BBBB.dart';
import 'package:deadwhispers/Pages/Act2/Gameplay2iiA.dart';
import 'package:deadwhispers/Pages/Act2/Gameplay2iiB.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay2ii extends StatefulWidget {
  const Gameplay2ii({super.key});

  @override
  _Gameplay2iiState createState() => _Gameplay2iiState();
}

class _Gameplay2iiState extends State<Gameplay2ii> {
  bool _isTextComplete = false;

  @override
  void initState() {
    super.initState();
    _isTextComplete = false;
  }

  void _onTap() {
    if (!_isTextComplete) {
      setState(() {
        _isTextComplete = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // FlameAudio.play('vibrate.mp3', volume: soundVolume);
    return GestureDetector(
      onTap: _onTap,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gameplay2ii.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 470,
              left: 15,
              right: 15,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Color.fromARGB(255, 226, 217, 217),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        child: _isTextComplete
                            ? Text(
                                'You look towards a hanging sign board in the room, which reads:\n\n"Love and respect the dead, for they hold secrets untold."\n\nThe room suddenly feels colder, and you hear a distant, mournful wail.\n',
                                textAlign: TextAlign.start,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'You look towards a hanging sign board in the room, which reads:\n\n"Love and respect the dead, for they hold secrets untold."\n\nThe room suddenly feels colder, and you hear a distant, mournful wail.\n',
                                    textAlign: TextAlign.start,
                                    speed: Duration(milliseconds: 50),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: Duration(milliseconds: 1000),
                                isRepeatingAnimation: false,
                                onTap: () {
                                  setState(() {
                                    _isTextComplete = true;
                                  });
                                },
                              ),
                      ),
                      if (_isTextComplete) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.02, // Adjust this value to reduce space between text and buttons
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gameplay2iiA()),
                            );
                            FlameAudio.play('drawer.mp3', volume: soundVolume);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_A_gameplay2ii.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.01, // Adjust this value to reduce space between buttons
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gameplay2iiB()),
                            );
                            FlameAudio.play('woodCreak.mp3',
                                volume: soundVolume);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_B_gameplay2ii.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
