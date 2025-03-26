import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/screens/LoginScreen.dart';
import 'package:campus_event_app/widgets/admin/bottombar.dart';
import 'package:campus_event_app/widgets/admin/eventstats.dart';
import 'package:campus_event_app/widgets/admin/pendingeventstats.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Event> events = [];
  Widget screen = EventStatsPage();
  void setWidget(int i) {
    if (i == 0) {
      if (mounted) {
        setState(() {
          screen = EventStatsPage();
        });
      }
    }
    if (i == 1) {
      if (mounted) {
        setState(() {
          screen = PendingEventStats();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 208, 210),
        // title: Text("Admin"),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(
                Color.fromARGB(43, 121, 85, 72),
              ),
            ),
            onPressed: () {
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
            AdminBottomBar(setWidget),
          ],
        ),
      ),
    );
  }
}
