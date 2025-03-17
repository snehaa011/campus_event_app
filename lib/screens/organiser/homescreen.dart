import 'package:campus_event_app/screens/LoginScreen.dart';
import 'package:campus_event_app/screens/organiser/createevent.dart';
import 'package:campus_event_app/screens/organiser/profilepage.dart';
import 'package:campus_event_app/screens/organiser/viewevent.dart';
import 'package:flutter/material.dart';

class OrganiserHomePage extends StatefulWidget {
  const OrganiserHomePage({super.key});

  @override
  State<OrganiserHomePage> createState() => _OrganiserHomePageState();
}

class _OrganiserHomePageState extends State<OrganiserHomePage> {
  int index = 0;

  final screens = [ViewEventPage(), OrganiserProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrganiserProfilePage(),
                ),
              );
          },
          icon: Icon(
            Icons.account_circle_outlined,
            size: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateEvent(),
                ),
              );
            },
            icon: Icon(
              Icons.notifications_none,
              size: 32,
            ),
          ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            elevation: 10,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateEvent(),
                ),
              );
            },
            child: Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
