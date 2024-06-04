import 'package:deadwhispers/Pages/Act1/Gameplay1AAA.dart';
import 'package:deadwhispers/Pages/Act1/Gameplay1AAB.dart';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay1AA extends StatefulWidget {
  const Gameplay1AA({super.key});

  @override
  _Gameplay1AAState createState() => _Gameplay1AAState();
}

class _Gameplay1AAState extends State<Gameplay1AA> {
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
                  image: AssetImage('assets/images/gameplay1AA.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 35,
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
                          fontSize: 19,
                        ),
                        child: _isTextComplete
                            ? Text(
                                'The message behind the picture frame: "Dear Player, if you are reading this, know that curiosity can be a dangerous thing. Sometimes, the past should remain buried."\n\nA gust of wind blows out the candles, and you hear footsteps behind you.',
                                textAlign: TextAlign.start,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'The message behind the picture frame: "Dear Player, if you are reading this, know that curiosity can be a dangerous thing. Sometimes, the past should remain buried."\n\nA gust of wind blows out the candles, and you hear footsteps behind you.',
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
                                  builder: (context) => Gameplay1AAA()),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_A_gameplay1AA.png',
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
                                  builder: (context) => Gameplay1AAB()),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_B_gameplay1AA.png',
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
