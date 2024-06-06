import 'package:deadwhispers/Pages/Act2/Gameplay2iiAA.dart';
import 'package:deadwhispers/Pages/Act2/Gameplay2iiBBB.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay2iiBB extends StatefulWidget {
  const Gameplay2iiBB({super.key});

  @override
  _Gameplay2iiBBState createState() => _Gameplay2iiBBState();
}

class _Gameplay2iiBBState extends State<Gameplay2iiBB> {
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
                  image: AssetImage('assets/images/gameplay2iiBB.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 200,
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
                                'Your phone glitches, showing images of places you’ve never been but feel oddly familiar.',
                                textAlign: TextAlign.start,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Your phone glitches, showing images of places you’ve never been but feel oddly familiar.',
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
                                  builder: (context) => Gameplay2iiAA()),
                            );
                            FlameAudio.play('drawer.mp3', volume: soundVolume);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_A_gameplay2iiBB.png',
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
                                  builder: (context) => Gameplay2iiBBB()),
                            );
                            FlameAudio.play('woodCreak.mp3',
                                volume: soundVolume);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_B_gameplay2iiBB.png',
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
