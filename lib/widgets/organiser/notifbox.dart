// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/sneha_test.dart';
import 'package:campus_event_app/screens/organiser/eventpage.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  Notify not = Notify();
  NotificationBox(Notify n, {super.key}) {
    not = n;
  }
  @override
  Widget build(BuildContext context) {
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
              "${not.event.name} ${not.msg}",
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
                    builder: (context) => ViewEventPage(event: not.event),
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
