import 'package:deadwhispers/Pages/Act1.dart/Gameplay1AA.dart';
import 'package:flutter/material.dart';

class Gameplay1A extends StatelessWidget {
  const Gameplay1A({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gameplay1AA()),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gameplay1A.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
