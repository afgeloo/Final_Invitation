import 'package:deadwhispers/Pages/MainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay4BA1 extends StatefulWidget {
  const Gameplay4BA1({Key? key}) : super(key: key);

  @override
  _Gameplay4BA1State createState() => _Gameplay4BA1State();
}

class _Gameplay4BA1State extends State<Gameplay4BA1> {
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
                  image: AssetImage('assets/images/gameover.png'),
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
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 217, 217),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    child: _isTextComplete
                        ? Text(
                            'By disregarding the solemnity of the funeral, you show a lack of respect for the deceased. After you open the casket and see yourself inside, the spirits, angered by your disregard, enact their vengeance. You are now the one trapped within the coffin, surrounded by darkness. The shocking revelation dawns upon you: YOU ARE THE DECEASED, not your relative.\n\n\nGAME OVER...',
                            textAlign: TextAlign.start,
                          )
                        : AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'By disregarding the solemnity of the funeral, you show a lack of respect for the deceased. After you open the casket and see yourself inside, the spirits, angered by your disregard, enact their vengeance. You are now the one trapped within the coffin, surrounded by darkness. The shocking revelation dawns upon you: YOU ARE THE DECEASED, not your relative.\n\n\nGAME OVER...',
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
