import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/screens/signinscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 196, 191),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                ElevatedButton(
                  style: lgn,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen("student"),
                      ),
                    ),
                  },
                  child: Text(
                    'Student',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: lgn,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen("organiser"),
                      ),
                    ),
                  },
                  child: Text(
                    'Organiser',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: lgn,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen("admin"),
                      ),
                    ),
                  },
                  child: Text(
                    'Admin',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
