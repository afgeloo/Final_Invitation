import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deadwhispers/Pages/Act3/follow.dart';
import 'package:deadwhispers/Pages/Act3/cabin.dart';

class Gameplay3 extends StatefulWidget {
  const Gameplay3({Key? key}) : super(key: key);

  @override
  _Gameplay3State createState() => _Gameplay3State();
}

class _Gameplay3State extends State<Gameplay3> {
  int tapCount = 0;

  void _handleTap() {
    setState(() {
      tapCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container();

    if (tapCount == 0) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'A mysterious figure starts pushing logs to block the pathway and leashes a dog by the side of an abandoned cabin.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: Duration(milliseconds: 1000),
      );
    } else if (tapCount == 1) {
      content = Text(
        'A mysterious figure starts pushing logs to block the pathway and leashes a dog by the side of an abandoned cabin.',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    } else if (tapCount == 2) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'You have a vision of the future: a small child running into the woods, chased by a shadowy figure.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: Duration(milliseconds: 1000),
      );
    } else if (tapCount == 3) {
      content = Text(
        'You have a vision of the future: a small child running into the woods, chased by a shadowy figure.',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      body: GestureDetector(
        onTap: _handleTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/gameplay3.png"),
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),
          child: Stack(
            children: [
              if (tapCount != 4)
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      padding: EdgeInsets.all(19.0),
                      margin: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: content,
                    ),
                  ),
                ),
              if (tapCount != 4)
                Positioned(
                  bottom: -100,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Image.asset(
                      'assets/images/main.png',
                      width: 700,
                      height: 700,
                    ),
                  ),
                ),
              if (tapCount == 4)
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white, width: 1)),
                          minimumSize: Size(270, 40),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FollowFigure()),
                          );
                        },
                        child: Text(
                          'A. Follow the mysterious figure.',
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white, width: 1)),
                          minimumSize: Size(270, 40),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cabin()),
                          );
                        },
                        child: Text(
                          'B. Inspect the dog and the cabin.',
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
