import 'package:flutter/material.dart';

class Gameplay1BBBA extends StatelessWidget {
  const Gameplay1BBBA({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gameplay1BBBA()),
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
                  image: AssetImage('assets/images/gameplay1BBBA.png'),
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
