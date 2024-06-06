import 'package:deadwhispers/Pages/Act5/conclusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// ako
class altEnd extends StatefulWidget {
  const altEnd({Key? key}) : super(key: key);

  @override
  _altEndState createState() => _altEndState();
}

class _altEndState extends State<altEnd> {
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
        MaterialPageRoute(builder: (context) => conclusion()),
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
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 290,
              left: 0,
              right: 0,
              child: Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 217, 217),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  child: _isTextComplete
                      ? Text(
                          'You resist the urge to look into the closed casket, sensing that some things are better left undisturbed. The present self wakes up from a dream, never having seen the relative\'s casket. As you decide to go near it, a paper flies right in front of you. As you grab the paper, the room darkens, and you hear the wind chime sound eerily. The paper reveals an old family secret, \nhinting at a cycle of hauntings that has plagued your lineage. As you read, you feel a chill run down your spine, and the room feels suffocatingly cold. You look back, and see your mother calling you to go home, but her face is pale, almost ghostly.\nAs you leave, you feel a sense of peace, knowing you respected the boundary between life and death. \nHowever, this peace is fleeting. The phone buzzes one last time with a message: "The past never rests. Remember, respect the dead." \nYou look back one last time and see a shadowy figure waving goodbye, its form flickering like a dying flame.\nUpon returning home, the sense of dread does not leave you. Night after night, you are haunted by visions of the funeral and whispers that seem to come from nowhere. The dreams become more vivid, more terrifying, and each morning you wake up feeling a little more disconnected from reality.\nThe letter remains with you, its words now etched into your mind. You realize that you are now part of the cycle, destined to relive this haunting until the end of your days. \nThe sense of impending doom never leaves, and every shadow, every whisper, reminds you that the dead are always watching, always waiting for the next time you cross their path. The haunting will never end, and you are forever trapped in this loop of fear and regret.',
                          textAlign: TextAlign.center,
                        )
                      : AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'You resist the urge to look into the closed casket, sensing that some things are better left undisturbed. The present self wakes up from a dream, never having seen the relative\'s casket. As you decide to go near it, a paper flies right in front of you. As you grab the paper, the room darkens, and you hear the wind chime sound eerily. The paper reveals an old family secret, \nhinting at a cycle of hauntings that has plagued your lineage. As you read, you feel a chill run down your spine, and the room feels suffocatingly cold. You look back, and see your mother calling you to go home, but her face is pale, almost ghostly.\nAs you leave, you feel a sense of peace, knowing you respected the boundary between life and death. \nHowever, this peace is fleeting. The phone buzzes one last time with a message: "The past never rests. Remember, respect the dead." \nYou look back one last time and see a shadowy figure waving goodbye, its form flickering like a dying flame.\nUpon returning home, the sense of dread does not leave you. Night after night, you are haunted by visions of the funeral and whispers that seem to come from nowhere. The dreams become more vivid, more terrifying, and each morning you wake up feeling a little more disconnected from reality.\nThe letter remains with you, its words now etched into your mind. You realize that you are now part of the cycle, destined to relive this haunting until the end of your days. \nThe sense of impending doom never leaves, and every shadow, every whisper, reminds you that the dead are always watching, always waiting for the next time you cross their path. The haunting will never end, and you are forever trapped in this loop of fear and regret.',
                              textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
