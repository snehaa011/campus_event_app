// ignore_for_file: use_build_context_synchronously

import 'package:campus_event_app/auth_service.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/screens/admin/homescreen.dart';
import 'package:campus_event_app/screens/organiser/homescreen.dart';
import 'package:campus_event_app/screens/student/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthService _authService = AuthService();
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

  Future<void> navigate(String str, BuildContext context) async {
    User? user = await _authService.signInWithGoogle();
    if (user != null) {
      if (str == 'student') {
        if (!await student.checkStudent(user.email)) {
          student.addStudent(user.email as String, user.displayName as String);
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
      setUser();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Only @nitc.ac.in emails are allowed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d0,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network("https://i.ibb.co/CKHbJtD6/NITC.png"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => {
                  navigate("student", context),
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: d1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Student',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => {
                  navigate("organiser", context),
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: d1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Organiser',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => {
                  navigate("admin", context),
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: d1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 15,
                    child: Image.network(
                        "https://i.ibb.co/Jj5r77tL/images-removebg-preview.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign In with Google",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
