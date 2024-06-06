import 'package:deadwhispers/Pages/Act3/gameplay3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay2iiBBBB extends StatefulWidget {
  const Gameplay2iiBBBB({Key? key}) : super(key: key);

  @override
  _Gameplay2iiBBBBState createState() => _Gameplay2iiBBBBState();
}

class _Gameplay2iiBBBBState extends State<Gameplay2iiBBBB> {
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
        MaterialPageRoute(builder: (context) => Gameplay3()),
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
                  image: AssetImage('assets/images/gameplay2iiBBBB.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 610,
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
                            'You discover a drawer with a diary containing more personal stories and warnings. The last entry reads:\n\n"She’s here. She’s watching."\n\n\nContinue...',
                            textAlign: TextAlign.start,
                          )
                        : AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'You discover a drawer with a diary containing more personal stories and warnings. The last entry reads:\n\n"She’s here. She’s watching."\n\n\nContinue...',
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
