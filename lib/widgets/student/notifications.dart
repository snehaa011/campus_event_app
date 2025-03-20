import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/widgets/student/notificationbox.dart';
import 'package:flutter/material.dart';

class StudentNotifications extends StatelessWidget {
  const StudentNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Updates",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ListView.builder(
              itemCount: notifications.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => StudentNotificationBox(
                notifications[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
