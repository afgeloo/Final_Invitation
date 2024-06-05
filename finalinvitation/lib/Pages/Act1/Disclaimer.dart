import 'package:deadwhispers/Pages/Act1/Gameplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// ako ay may lobo lumipad sa langit
class Disclaimer extends StatefulWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  _DisclaimerState createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
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
        MaterialPageRoute(builder: (context) => Gameplay()),
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
                  image: AssetImage('assets/images/disclaimer.png'),
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
                          'This interactive story game is\nentirely fictional, with characters\nand events created by the\ndevelopers\' imagination. It includes\nsimulated glitches, flashing lights,\nand rapid screen transitions, which\nmay unsettle some players. Players\nwith photosensitive epilepsy or\nsensitivity to flashing lights should\nuse caution.\n\nIf you feel uncomfortable at any\npoint, pause the game and take a\nbreak for your well-being.',
                          textAlign: TextAlign.center,
                        )
                      : AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'This interactive story game is\nentirely fictional, with characters\nand events created by the\ndevelopers\' imagination. It includes\nsimulated glitches, flashing lights,\nand rapid screen transitions, which\nmay unsettle some players. Players\nwith photosensitive epilepsy or\nsensitivity to flashing lights should\nuse caution.\n\nIf you feel uncomfortable at any\npoint, pause the game and take a\nbreak for your well-being.',
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
