import 'package:deadwhispers/Pages/enterUsername.dart';
import 'package:deadwhispers/Pages/listUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemNavigator

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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
                image: AssetImage('assets/images/main_menu.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.67, // Adjust top position as needed
            left: MediaQuery.of(context).size.width *
                0.2, // Adjust left position as needed
            child: GestureDetector(
              onTap: () {
                // Enter their names before playing the game
                enterUsername(context);
              },
              child: Image.asset(
                'assets/images/button_play.png',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.74, // Adjust top position as needed
            left: MediaQuery.of(context).size.width *
                0.2, // Adjust left position as needed
            child: GestureDetector(
              onTap: () {
                // Navigate to the list of players
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListUsers()),
                );
              },
              child: Image.asset(
                'assets/images/button_how.png',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.13,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.865, // Adjust top position as needed
            left: MediaQuery.of(context).size.width *
                0.2, // Adjust left position as needed
            child: GestureDetector(
              onTap: () {
                // Exit the application
                SystemNavigator
                    .pop(); // Use SystemNavigator.pop() to close the app
              },
              child: Image.asset(
                'assets/images/button_exit.png',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.075,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
