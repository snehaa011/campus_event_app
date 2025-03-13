// ignore_for_file: must_be_immutable

import 'package:campus_event_app/screens/admin/homescreen.dart';
import 'package:campus_event_app/screens/organiser/homescreen.dart';
import 'package:campus_event_app/screens/student/homescreen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  late String user = "";
  SignInScreen(String u, {super.key}) {
    user = u;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 25, 99, 211),
                ),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.fromLTRB(0, 20, 0, 20),
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size.fromWidth(MediaQuery.of(context).size.width / 2),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () => {
                if (user == 'student')
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentHomePage()),
                      (Route<dynamic> route) => false)
                else if (user == 'organiser')
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrganiserHomePage()),
                      (Route<dynamic> route) => false)
                else if (user == 'admin')
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHomePage()),
                      (Route<dynamic> route) => false)
                else
                  Navigator.pop(context),
              },
              child: Text(
                "Sign In with Google",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
