import 'package:deadwhispers/Pages/Act5/conclusion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class badEnd extends StatefulWidget {
  const badEnd({Key? key}) : super(key: key);

  @override
  _badEndState createState() => _badEndState();
}

class _badEndState extends State<badEnd> {
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
                          'You find yourself in an abandoned place that looks like a funeral but without any picture frames. The air is thick with a sense of dread, and the only sound is the creaking of old wood and the faint echo of distant whispers. \nYou open the closed casket and see yourself inside. As you look closer, your reflection\'s eyes open and stare back at you with a malevolent glare. The room around you begins to warp, the walls melting into shadows that twist and writhe.\nDesperately, you try to connect the dots more, grabbing the letter from earlier, but instead of a letter, you hold a crumpled picture of yourself, distorted and decayed. \nThe empty picture frame closes in on you, its edges growing sharp and menacing. Shadows envelop you, and you hear the whispering voices of your ancestors, blaming you for disturbing their rest.\nAs the shadows consume you, you realize that you are trapped in this dark, twisted version of the room. The wind chime falls and shatters, its sound reverberating like a death knell. \nYour vision fades to black as the whispers grow louder, now more of a cacophony of screams, marking your eternal entrapment within this cursed place. The final words you hear are, \n"You should have let the past rest."',                          textAlign: TextAlign.center,
                        )
                      : AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'You find yourself in an abandoned place that looks like a funeral but without any picture frames. The air is thick with a sense of dread, and the only sound is the creaking of old wood and the faint echo of distant whispers. \nYou open the closed casket and see yourself inside. As you look closer, your reflection\'s eyes open and stare back at you with a malevolent glare. The room around you begins to warp, the walls melting into shadows that twist and writhe.\nDesperately, you try to connect the dots more, grabbing the letter from earlier, but instead of a letter, you hold a crumpled picture of yourself, distorted and decayed. \nThe empty picture frame closes in on you, its edges growing sharp and menacing. Shadows envelop you, and you hear the whispering voices of your ancestors, blaming you for disturbing their rest.\nAs the shadows consume you, you realize that you are trapped in this dark, twisted version of the room. The wind chime falls and shatters, its sound reverberating like a death knell. \nYour vision fades to black as the whispers grow louder, now more of a cacophony of screams, marking your eternal entrapment within this cursed place. The final words you hear are, \n"You should have let the past rest."',                          textAlign: TextAlign.center,

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
