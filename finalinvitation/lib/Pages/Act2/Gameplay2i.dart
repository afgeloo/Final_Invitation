import 'package:deadwhispers/Pages/Act2/Gameplay2.dart';
import 'package:deadwhispers/Pages/Act2/Gameplay2ii.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay2i extends StatefulWidget {
  const Gameplay2i({Key? key}) : super(key: key);

  @override
  _Gameplay2iState createState() => _Gameplay2iState();
}

class _Gameplay2iState extends State<Gameplay2i> {
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gameplay2ii()),
      ).then((_) {
        setState(() {
          _isTextComplete = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // FlameAudio.play('woodCreak.mp3', volume: soundVolume);
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
                  image: AssetImage('assets/images/gameplay2i.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 550,
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
                            'You start to feel alarmed, thinking someone else might be inside the tent, watching you since you entered. Nevertheless, you shrug the idea off,dismissing it as superstition.\n\n\nContinue...',
                            textAlign: TextAlign.start,
                          )
                        : AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'You start to feel alarmed, thinking someone else might be inside the tent, watching you since you entered. Nevertheless, you shrug the idea off,dismissing it as superstition.\n\n\nContinue...',
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
