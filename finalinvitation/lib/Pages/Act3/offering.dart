import 'package:deadwhispers/Pages/gameoverscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:just_audio/just_audio.dart';

class Offering extends StatefulWidget {
  const Offering({Key? key}) : super(key: key);

  @override
  _OfferingState createState() => _OfferingState();
}

class _OfferingState extends State<Offering>
    with SingleTickerProviderStateMixin {
  late AudioPlayer audioPlayer;
  Timer? _brightnessTimer;
  bool _isBrightnessOn = true;
  late AnimationController _controller;
  late Animation<double> _animation;
  int tapCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> loadSound(String soundPath) async {
    await audioPlayer.setAsset('assets/audios/$soundPath');
    audioPlayer.play();
  }

  void _handleTap() {
    setState(() {
      tapCount++;

      if (tapCount == 2) {
        loadSound('wolf_howl.mp3');
      }
      if (tapCount >= 4) {
        _brightnessTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
          toggleBrightness();
        });
      } else {
        _brightnessTimer?.cancel();
        toggleBrightness();
      }

      if (tapCount == 6) {
        loadSound('jumpscare.mp3');
        Future.delayed(Duration(seconds: 1), () {
          _controller.forward();
        });
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => GameOverScreen(
                      message:
                          'You tried to escape, but it\'s too late, the darkness consumes you. Taking the offering was a grave mistake, disrespecting the sacred ritual, sealing your fate in death.',
                    )),
          );
        });
      }
    });
  }

  void toggleBrightness() {
    if (_isBrightnessOn) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      _isBrightnessOn = false;
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      _isBrightnessOn = true;
    }
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
            'As you reach out to take one of the offerings, a sudden gust of wind sweeps through the cabin, extinguishing the candles and sending chills down your spine.',
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
        'As you reach out to take one of the offerings, a sudden gust of wind sweeps through the cabin, extinguishing the candles and sending chills down your spine.',
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
            'The dog\'s howls intensify, reverberating through the cabin, as if warning you of impending danger.',
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
        'The dog\'s howls intensify, reverberating through the cabin, as if warning you of impending danger.',
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
            'The lights flicker erratically, casting grotesque shadows that seem to dance along the walls, twisting and contorting with each flicker.',
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
        'The lights flicker erratically, casting grotesque shadows that seem to dance along the walls, twisting and contorting with each flicker.',
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
                    top: 370,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: 0.8,
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
                if (tapCount == 2 || tapCount == 3)
                  Positioned(
                    top: 270,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Image.asset(
                        'assets/images/dog.png',
                        width: 700,
                        height: 700,
                      ),
                    ),
                  ),
                if (tapCount >= 6)
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value * 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/figure.png'),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
