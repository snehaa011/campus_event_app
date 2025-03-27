import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/widgets/student/notificationbox.dart';
import 'package:campus_event_app/widgets/student/shimmernotificationbox.dart';
import 'package:flutter/material.dart';

class StudentNotifications extends StatefulWidget {
  const StudentNotifications({super.key});

  @override
  State<StudentNotifications> createState() => _StudentNotificationsState();
}

class _StudentNotificationsState extends State<StudentNotifications> {
  List<Notify> notifications = [];
  bool load = true;

  void getNotifications() async {
    var k = await noti.getNotifications();
    if (mounted) {
      setState(() {
        notifications = k;
        load = false;
      });
    }
    // print(notifications);
  }

  @override
  void initState() {
    super.initState();
    getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: dd,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Updates",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 233, 233, 233),
                ),
              ),
            ),
            load
                ? ListView.builder(
                    itemBuilder: (context, index) =>
                        StudentShimmerNotificationBox(),
                    itemCount: 3,
                    shrinkWrap: true,
                  )
                : ListView.builder(
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
