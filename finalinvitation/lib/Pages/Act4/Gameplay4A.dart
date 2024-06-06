import 'package:deadwhispers/Pages/Act4/Gameplay4A1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay4A extends StatefulWidget {
  const Gameplay4A({Key? key}) : super(key: key);

  @override
  _Gameplay4AState createState() => _Gameplay4AState();
}

class _Gameplay4AState extends State<Gameplay4A> {
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
        MaterialPageRoute(builder: (context) => Gameplay4A1()),
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
                  image: AssetImage('assets/images/gameplay4A.png'),
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
                                'Your curiosity gets the better of you, and you cautiously approach the casket. With trembling hands, you slowly lift the lid, revealing the dark interior within. As you peer inside, a wave of dread washes over you as you see yourself. The room around you begins to warp and distort, and you find yourself trapped within the confines of the coffin, surrounded by darkness and the echoes of your own fearful thoughts.',                                textAlign: TextAlign.start,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Your curiosity gets the better of you, and you cautiously approach the casket. With trembling hands, you slowly lift the lid, revealing the dark interior within. As you peer inside, a wave of dread washes over you as you see yourself. The room around you begins to warp and distort, and you find yourself trapped within the confines of the coffin, surrounded by darkness and the echoes of your own fearful thoughts.',                                    textAlign: TextAlign.start,
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
