import 'package:deadwhispers/Pages/Act4/Gameplay41.dart';
import 'package:deadwhispers/Pages/Act4/Gameplay4B.dart';
import 'package:deadwhispers/Pages/Act5/altEnd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay4BB extends StatefulWidget {
  const Gameplay4BB({Key? key}) : super(key: key);

  @override
  _Gameplay4BBState createState() => _Gameplay4BBState();
}

class _Gameplay4BBState extends State<Gameplay4BB> {
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
        MaterialPageRoute(builder: (context) => altEnd()),
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
                  image: AssetImage('assets/images/gameplay4BB.png'),
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
                                'With a sense of unease weighing heavily upon you, you choose to leave the funeral room behind, hoping to escape the oppressive atmosphere that seems to permeate every corner. As you step outside, a feeling of relief washes over you, and you breathe a sigh of relief as the presence of the room fades into the distance. However, a lingering sense of foreboding lingers in the back of your mind, a reminder that some secrets are best left undisturbed.',                                textAlign: TextAlign.start,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'With a sense of unease weighing heavily upon you, you choose to leave the funeral room behind, hoping to escape the oppressive atmosphere that seems to permeate every corner. As you step outside, a feeling of relief washes over you, and you breathe a sigh of relief as the presence of the room fades into the distance. However, a lingering sense of foreboding lingers in the back of your mind, a reminder that some secrets are best left undisturbed.',                                  textAlign: TextAlign.start,
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
