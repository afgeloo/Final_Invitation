import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FollowFigure extends StatefulWidget {
  const FollowFigure({Key? key}) : super(key: key);

  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<FollowFigure> {
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
            'You follow the figure and see them perform a ritual near the logs, whispering in an unknown language.',
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
        'You follow the figure and see them perform a ritual near the logs, whispering in an unknown language.',
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
            'hey leave behind a journal that hints at dark secrets and the consequences of disturbing the dead. The figure turns to you, revealing a skeletal face.',
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
        'They leave behind a journal that hints at dark secrets and the consequences of disturbing the dead. The figure turns to you, revealing a skeletal face.',
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
              image: AssetImage("assets/images/follow_figure.png"),
              fit: BoxFit.cover,
              alignment: Alignment.center,
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
                  left: -280,
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
                        onPressed: () {},
                        child: Text(
                          'A. Take the journal.',
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
                        onPressed: () {},
                        child: Text(
                          'B. Leave the journal alone.',
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
