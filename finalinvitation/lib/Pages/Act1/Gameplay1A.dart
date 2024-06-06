import 'package:deadwhispers/Pages/Act1/Gameplay1AA.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay1A extends StatefulWidget {
  const Gameplay1A({Key? key}) : super(key: key);

  @override
  _Gameplay1AState createState() => _Gameplay1AState();
}

class _Gameplay1AState extends State<Gameplay1A> {
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
      FlameAudio.play('paper.mp3', volume: soundVolume);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gameplay1AA()),
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
                  image: AssetImage('assets/images/gameplay1A.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 580,
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
                            'As you slowly creep up to the casket, you notice that the picture frame on the right seems odd. You go towards it and realize that the rear part can be opened. Behind it, you find a note.\n\n\nContinue...',
                            textAlign: TextAlign.start,
                          )
                        : AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'As you slowly creep up to the casket, you notice that the picture frame on the right seems odd. You go towards it and realize that the rear part can be opened. Behind it, you find a note.\n\n\nContinue...',
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
