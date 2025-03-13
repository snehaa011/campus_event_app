import 'package:campus_event_app/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class OrganiserHomePage extends StatelessWidget {
  const OrganiserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organiser"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
