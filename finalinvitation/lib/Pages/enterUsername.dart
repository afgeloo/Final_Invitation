import 'package:deadwhispers/Pages/Act1.dart/Disclaimer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController _nameController = TextEditingController();

void enterUsername(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Center(
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),

          //Background image
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/enterUsernamebg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),

                //TextField title
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "In Memoriam of..",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.yellow,
                          ),
                        ),

                        //TextField
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Enter your name",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        //Submit Button
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            List<String> names =
                                prefs.getStringList('names') ?? [];
                            names.add(_nameController.text);
                            await prefs.setStringList('names', names);
                            _nameController.clear();

                            //After entering the name, transition to disclaimer.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Disclaimer()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            minimumSize: Size(180, 40),
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),

                        //Back Button
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            minimumSize: Size(180, 40),
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
