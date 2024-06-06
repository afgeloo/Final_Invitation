import 'package:deadwhispers/Pages/MainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class conclusion extends StatefulWidget {
  const conclusion({Key? key}) : super(key: key);

  @override
  _conclusionState createState() => _conclusionState();
}

class _conclusionState extends State<conclusion> {
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
        MaterialPageRoute(builder: (context) => MainMenu()),
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
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 290,
              left: 0,
              right: 0,
              child: Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 217, 217),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  child: _isTextComplete
                      ? Text(
                          'Sometimes, it’s best to let the past rest in peace. \nYou have the power to choose between curiosity and respect. \nWhat will you do next time?',
                          textAlign: TextAlign.center,
                        )
                      : AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Sometimes, it’s best to let the past rest in peace. \nYou have the power to choose between curiosity and respect. \nWhat will you do next time?',
                              textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
