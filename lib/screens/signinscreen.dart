// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:campus_event_app/auth_service.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/screens/admin/homescreen.dart';
import 'package:campus_event_app/screens/organiser/homescreen.dart';
import 'package:campus_event_app/screens/student/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final String str;
  final AuthService _authService = AuthService();
  SignInScreen(this.str, {super.key});

  void checkValidUser(String user, String str, BuildContext context) async {
    if (str == 'organiser') {
      bool b = await checkUser(user, 'organizers');
      if (b) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => OrganiserHomePage(),
            ),
            (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Unauthorized user"),
          ),
        );
      }
    } else if (str == 'admin') {
      bool b = await checkUser(user, 'admin');
      if (b) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => AdminHomePage(),
            ),
            (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Unauthorized user"),
          ),
        );
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 196, 191),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.brown,
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
              onPressed: () async {
                User? user = await _authService.signInWithGoogle();
                if (user != null) {
                  if (str == 'student') {
                    if (!await student.checkStudent(user.email)) {
                      student.addStudent(
                          user.email as String, user.displayName as String);
                    }
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentHomePage(),
                        ),
                        (Route<dynamic> route) => false);
                  } else if (str == 'organiser') {
                    checkValidUser(user.email as String, str, context);
                  } else if (str == 'admin') {
                    checkValidUser(user.email as String, str, context);
                  } else {
                    Navigator.pop(context);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Only @nitc.ac.in emails are allowed"),
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Image.network(
                        "https://static.vecteezy.com/system/resources/previews/022/613/027/non_2x/google-icon-logo-symbol-free-png.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign In with Google",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
