import 'package:campus_event_app/screens/signinscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 25, 99, 211),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    fixedSize: WidgetStatePropertyAll(
                      Size.fromWidth(MediaQuery.of(context).size.width / 2),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
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
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 25, 99, 211),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    fixedSize: WidgetStatePropertyAll(
                      Size.fromWidth(MediaQuery.of(context).size.width / 2),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
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
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 25, 99, 211),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.fromLTRB(50, 20, 50, 20),
                    ),
                    fixedSize: WidgetStatePropertyAll(
                      Size.fromWidth(MediaQuery.of(context).size.width / 2),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
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
