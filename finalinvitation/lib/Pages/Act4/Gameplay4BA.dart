import 'package:deadwhispers/Pages/Act4/Gameplay4BA.dart';
import 'package:deadwhispers/Pages/Act4/Gameplay4BB.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Gameplay4BA extends StatefulWidget {
  const Gameplay4BA({Key? key}) : super(key: key);

  @override
  _Gameplay4BAState createState() => _Gameplay4BAState();
}

class _Gameplay4BAState extends State<Gameplay4BA> {
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
                  image: AssetImage(' '), ///////////////////
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
                            'Driven by a desire to uncover the truth, you begin to explore the funeral room in search of answers. Hidden compartments reveal artifacts and notes detailing the tragic history of your relative and their family. Each discovery serves to deepen the mystery, drawing you further into the web of darkness that surrounds your lineage. As you delve deeper, you unwittingly unearth a secret that binds you to your ancestor\'s fate, sealing your own doom in the process.',                          textAlign: TextAlign.start,    )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    
                                  'Driven by a desire to uncover the truth, you begin to explore the funeral room in search of answers. Hidden compartments reveal artifacts and notes detailing the tragic history of your relative and their family. Each discovery serves to deepen the mystery, drawing you further into the web of darkness that surrounds your lineage. As you delve deeper, you unwittingly unearth a secret that binds you to your ancestor\'s fate, sealing your own doom in the process.',                                    textAlign: TextAlign.start,
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
                                  builder: (context) => Gameplay4BA()), ///////////////////////
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_A_gameplay4B.png',
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
                                  builder: (context) => Gameplay4BB()), ///////////////////
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: Image.asset(
                              'assets/images/button_B_gameplay4B.png',
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
