// ignore_for_file: use_build_context_synchronously

import 'package:campus_event_app/auth_service.dart';
import 'package:campus_event_app/screens/loginscreen.dart';
import 'package:campus_event_app/widgets/student/bottombar.dart';
import 'package:campus_event_app/widgets/student/events.dart';
import 'package:campus_event_app/widgets/student/home.dart';
import 'package:campus_event_app/widgets/student/notifications.dart';
import 'package:campus_event_app/widgets/student/profile.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  StudentHomePage({super.key});
  final AuthService _authService = AuthService();
  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  Widget screen = StudentHome();
  int v = 0;
  void setWidget(int i) {
    v = i;
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
        backgroundColor: Colors.white,
        // title: Text("Student"),
        actions: [
          if (v == 3)
            TextButton(
              onPressed: () async {
                await widget._authService.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
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
