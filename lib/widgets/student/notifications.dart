import 'package:campus_event_app/widgets/student/notificationbox.dart';
import 'package:flutter/material.dart';

class StudentNotifications extends StatelessWidget {
  const StudentNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) => StudentNotificationBox(),
            ),
          ],
        ),
      ),
    );
  }
}
