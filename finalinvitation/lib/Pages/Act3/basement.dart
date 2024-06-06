import 'package:deadwhispers/Pages/Act3/dimension.dart';
import 'package:deadwhispers/Pages/Act3/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Basement extends StatefulWidget {
  const Basement({Key? key}) : super(key: key);

  @override
  BasementState createState() => BasementState();
}

class BasementState extends State<Basement> {
  int tapCount = 0;

  void _handleTap() {
    setState(() {
      tapCount++;
    });
  }

  Future<bool> _onWillPop() async {
    // Prevent the default back button behavior
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container();

    if (tapCount == 0) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'You decide to leave the offerings untouched, feeling uneasy about disturbing the altar. As you step away, your gaze falls upon the floor, where a faint glow catches your eye.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50), // Adjust typing speed here
          ),
        ],
        totalRepeatCount: 1, // Animation plays only once
        pause: Duration(milliseconds: 1000), // Pause after animation completes
      );
    } else if (tapCount == 1) {
      content = Text(
        'You decide to leave the offerings untouched, feeling uneasy about disturbing the altar. As you step away, your gaze falls upon the floor, where a faint glow catches your eye.',
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
            'Moving closer, you notice a symbol etched into the wooden boards, its intricate design pulsating with a faint, otherworldly light.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50), // Adjust typing speed here
          ),
        ],
        totalRepeatCount: 1, // Animation plays only once
        pause: Duration(milliseconds: 1000), // Pause after animation completes
      );
    } else if (tapCount == 3) {
      content = Text(
        'Moving closer, you notice a symbol etched into the wooden boards, its intricate design pulsating with a faint, otherworldly light.',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    } else if (tapCount == 4) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'The symbol seems to beckon you, its presence both mysterious and compelling.',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 50), // Adjust typing speed here
          ),
        ],
        totalRepeatCount: 1, // Animation plays only once
        pause: Duration(milliseconds: 1000), // Pause after animation completes
      );
    } else if (tapCount == 5) {
      content = Text(
        'The symbol seems to beckon you, its presence both mysterious and compelling.',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: GestureDetector(
          onTap: _handleTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/basement.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 200,
                  left: 0,
                  right: -200,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Image.asset(
                      'assets/images/main.png', // Provide your image path here
                      width: 600, // Adjust width according to your needs
                      height: 600, // Adjust height according to your needs
                    ),
                  ),
                ),
                if (tapCount < 6)
                  Positioned(
                    top: 500,
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
                if (tapCount >= 6)
                  Positioned(
                    top: 400,
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
                                side:
                                    BorderSide(color: Colors.white, width: 1)),
                            minimumSize:
                                Size(270, 40), // Fixed width and height
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dimension()),
                            );
                          },
                          child: Text(
                            'A. Step onto the symbol.',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side:
                                    BorderSide(color: Colors.white, width: 1)),
                            minimumSize:
                                Size(270, 60), // Fixed width and height
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrawerPage()),
                            );
                          },
                          child: Text(
                            'B. Avoid the symbol and look \n          around the room.',
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
      ),
    );
  }
}
