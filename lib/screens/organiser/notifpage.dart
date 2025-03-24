import 'package:campus_event_app/data/sneha_test.dart';
import 'package:campus_event_app/widgets/organiser/notifbox.dart';
import 'package:flutter/material.dart';

class ViewNotificationPage extends StatefulWidget {
  const ViewNotificationPage({super.key});

  @override
  State<ViewNotificationPage> createState() => _ViewNotificationPageState();
}

class _ViewNotificationPageState extends State<ViewNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: notifications.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => NotificationBox(
              notifications[index],
            ),
          ),
        ),
      ),
    );
  }
}
