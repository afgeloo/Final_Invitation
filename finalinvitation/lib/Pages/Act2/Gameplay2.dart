import 'package:deadwhispers/Pages/Act2/Gameplay2i.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay2 extends StatefulWidget {
  const Gameplay2({Key? key}) : super(key: key);

  @override
  _Gameplay2State createState() => _Gameplay2State();
}

class _Gameplay2State extends State<Gameplay2> {
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
        MaterialPageRoute(builder: (context) => Gameplay2i()),
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
                  image: AssetImage('assets/images/gameplay2.png'),
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
                            'From these notes, you already know the stories behind the picture frames. These stories offer insights that lead you somewhere. Then, an unknown contact texts you:\n\n"Do not regret any of your actions.""\n\n\nContinue...',
                            textAlign: TextAlign.start,
                          )
                        : AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'From these notes, you already know the stories behind the picture frames. These stories offer insights that lead you somewhere. Then, an unknown contact texts you:\n\n"Do not regret any of your actions.""\n\n\nContinue...',
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
