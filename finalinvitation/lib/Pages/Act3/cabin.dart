import 'package:deadwhispers/Pages/Act3/basement.dart';
import 'package:deadwhispers/Pages/Act3/offering.dart';
import 'package:deadwhispers/main.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:just_audio/just_audio.dart';

class Cabin extends StatefulWidget {
  const Cabin({Key? key}) : super(key: key);

  @override
  _CabinState createState() => _CabinState();
}

class _CabinState extends State<Cabin> {
  int tapCount = 0;

  @override
  void initState() {
    super.initState();
    FlameAudio.play('growl.mp3', volume: soundVolume);
  }

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
            'The dog growls at you, and the cabin door creaks open. Inside, you find an altar with various offerings and a note that says:',
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
        'The dog growls at you, and the cabin door creaks open. Inside, you find an altar with various offerings and a note that says:',
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
            '"Those who interfere with the dead shall face their wrath. Do not tread where you are not welcome."',
            textStyle: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
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
        '"Those who interfere with the dead shall face their wrath. Do not tread where you are not welcome."',
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      );
    } else if (tapCount == 4) {
      content = AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'The room shakes violently, and you hear a distant scream piercing through the air as the offering crumbles to dust in your hand. ',
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
        'The room shakes violently, and you hear a distant scream piercing through the air as the offering crumbles to dust in your hand. ',
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
                image: AssetImage("assets/images/cabin.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Stack(
              children: [
                if (tapCount < 6)
                  Positioned(
                    bottom: -170,
                    left: 0,
                    right: -220,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Image.asset(
                        'assets/images/main.png', // Provide your image path here
                        width: 700, // Adjust width according to your needs
                        height: 700, // Adjust height according to your needs
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
                                  builder: (context) => Offering()),
                            );
                          },
                          child: Text(
                            'A. Take an offering from the altar.',
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
                                  builder: (context) => Basement()),
                            );
                          },
                          child: Text(
                            'B. Leave the offerings and \n       continue exploring.',
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
