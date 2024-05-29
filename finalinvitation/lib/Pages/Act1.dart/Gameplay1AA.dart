import 'package:deadwhispers/Pages/Act1.dart/Gameplay1AAA.dart';
import 'package:deadwhispers/Pages/Act1.dart/Gameplay1AAB.dart';
import 'package:flutter/material.dart';

class Gameplay1AA extends StatelessWidget {
  const Gameplay1AA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/gameplay1AA.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.3, // Adjust top position as needed
            left: MediaQuery.of(context).size.width *
                0.105, // Adjust left position as needed
            child: GestureDetector(
              onTap: () {
                // Navigate to the next page (play)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gameplay1AAA()),
                );
              },
              child: Image.asset(
                'assets/images/button_A_gameplay1AA.png',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.36, // Adjust top position as needed
            left: MediaQuery.of(context).size.width *
                0.105, // Adjust left position as needed
            child: GestureDetector(
              onTap: () {
                // Navigate to the next page (how to play)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gameplay1AAB()),
                );
              },
              child: Image.asset(
                'assets/images/button_B_gameplay1AA.png',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
