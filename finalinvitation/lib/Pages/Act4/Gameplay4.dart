import 'package:deadwhispers/Pages/Act4/Gameplay4A.dart';
import 'package:deadwhispers/Pages/Act4/Gameplay4B.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay4 extends StatefulWidget {
  const Gameplay4({Key? key}) : super(key: key);

  @override
  _Gameplay4State createState() => _Gameplay4State();
}

class _Gameplay4State extends State<Gameplay4> {
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
                  image: AssetImage('                         '),///////////////////
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
                          fontSize: 20,
                        ),
                        child: _isTextComplete
                            ? Text(
                                'You\'ve connected the dots and are close to uncovering the truth, even though it\'s difficult to accept. You turn back to the phone, and it tells you: \n \“Sprinkle salt to drive away the evil spirits.\” The room\'s temperature drops drastically, and you see a shadow moving in the corner of your eye, a sinister presence lingering just beyond your sight. The need to perform the salt ritual becomes palpable, a desperate attempt to ward off the malevolent forces that lurk in the shadows, waiting to ensnare you in their grasp.',
                                textAlign: TextAlign.start,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'You\'ve connected the dots and are close to uncovering the truth, even though it\'s difficult to accept. You turn back to the phone, and it tells you: \n \“Sprinkle salt to drive away the evil spirits.\” The room\'s temperature drops drastically, and you see a shadow moving in the corner of your eye, a sinister presence lingering just beyond your sight. The need to perform the salt ritual becomes palpable, a desperate attempt to ward off the malevolent forces that lurk in the shadows, waiting to ensnare you in their grasp.',
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
                          height: MediaQuery.of(context).size.height * 0.02, // Adjust this value to reduce space between text and buttons
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gameplay4A()),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_A_gameplay4.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01, // Adjust this value to reduce space between buttons
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gameplay4B()),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_B_gameplay4.png',
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
