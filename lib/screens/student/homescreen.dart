import 'package:campus_event_app/screens/loginscreen.dart';
import 'package:campus_event_app/widgets/student/bottombar.dart';
import 'package:campus_event_app/widgets/student/events.dart';
import 'package:campus_event_app/widgets/student/home.dart';
import 'package:campus_event_app/widgets/student/notifications.dart';
import 'package:campus_event_app/widgets/student/profile.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  Widget screen = StudentHome();
  void setWidget(int i) {
    if (i == 0) {
      setState(() {
        screen = StudentHome();
      });
    } else if (i == 1) {
      setState(() {
        screen = StudentEvents();
      });
    } else if (i == 2) {
      setState(() {
        screen = StudentNotifications();
      });
    } else if (i == 3) {
      setState(() {
        screen = StudentProfile();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Student"),
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            screen,
            StudentBottomBar(setWidget),
          ],
        ),
      ),
    );
  }
}
