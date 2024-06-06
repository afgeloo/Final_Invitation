import 'package:deadwhispers/Pages/Act2/Gameplay2iiBB.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay2iiB extends StatefulWidget {
  const Gameplay2iiB({Key? key}) : super(key: key);

  @override
  _Gameplay2iiBState createState() => _Gameplay2iiBState();
}

class _Gameplay2iiBState extends State<Gameplay2iiB> {
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
    } else {
      FlameAudio.play('glitch.mp3', volume: soundVolume);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gameplay2iiBB()),
      ).then((_) {
        setState(() {
          _isTextComplete = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('assets/images/gameplay2iiB.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 15,
              right: 15,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 217, 217),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    child: _isTextComplete
                        ? Text(
                            'You receive a text from an unknown number:\n\n"The past is dangerous. Leave now."\n\nYour phone glitches, showing images of places you’ve never been but feel oddly familiar.\n\n\nContinue...',
                            textAlign: TextAlign.start,
                          )
                        : AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'You receive a text from an unknown number:\n\n"The past is dangerous. Leave now."\n\nYour phone glitches, showing images of places you’ve never been but feel oddly familiar.\n\n\nContinue...',
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
