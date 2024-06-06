import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List<String> _names = [];

  @override
  void initState() {
    super.initState();
    _loadNames();
  }

  _loadNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _names = prefs.getStringList('names') ?? [];
      _names.sort(); // Sort the names alphabetically
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/userListbg.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                SizedBox(height: 50), // Add some space at the top
                Center(
                  child: Text(
                    'In Memoriam of..',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ListView.builder(
                      itemCount: _names.length,
                      itemBuilder: (context, index) {
                        final sortedNames = _names.toList()
                          ..sort(); // Create a sorted copy of the list
                        return ListTile(
                          title: Text(sortedNames[index],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              textAlign: TextAlign.center),
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 80),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        minimumSize: Size(180, 40),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}