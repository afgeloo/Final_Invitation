import 'package:deadwhispers/Pages/MainMenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FinalInvitation());
}

class FinalInvitation extends StatelessWidget {
  const FinalInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
      //Vincent's added code
    );
  }
}
