import 'package:campus_event_app/screens/LoginScreen.dart';
import 'package:campus_event_app/widgets/admin/bottombar.dart';
import 'package:campus_event_app/widgets/admin/eventstats.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Widget screen = EventStatsPage(flag: 0);
  void setWidget(int i) {
    if (i == 0) {
      setState(() {
        screen = EventStatsPage(flag: i);
      });
    } else if (i == 1) {
      setState(() {
        screen =EventStatsPage(flag: i);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 210),
        title: Text("Admin"),
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
            AdminBottomBar(setWidget),
          ],
        ),
      ),
    );
  }
}
