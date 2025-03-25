// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/eventmodel.dart';
import 'package:campus_event_app/data/notifmodel.dart';
import 'package:campus_event_app/screens/organiser/eventpage.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  late Notif not;
  late Event e;
  NotificationBox(Notif n, {super.key}) {
    not = n;
  }
  void fetchData() async{
    e = await not.getEvent();
  }
  @override
  Widget build(BuildContext context) {
    fetchData();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${not.event} ${not.msg}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(0),
                ),
                overlayColor: WidgetStatePropertyAll(
                  const Color.fromARGB(14, 121, 85, 72),
                ),
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewEventPage(event: e),
                  ),
                ),
              },
              child: Text(
                "Go to event",
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
