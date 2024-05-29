import 'package:deadwhispers/Pages/Act1.dart/Gameplay.dart';
import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gameplay()),
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
                  image: AssetImage('assets/images/disclaimer.png'),
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
