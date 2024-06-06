import 'package:flutter/material.dart';
import 'package:deadwhispers/Pages/MainMenu.dart';

void main() {
  runApp(FinalInvitation());
}

class FinalInvitation extends StatelessWidget {
  const FinalInvitation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    );
  }
}
