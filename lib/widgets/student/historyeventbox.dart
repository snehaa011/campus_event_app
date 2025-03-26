// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';

class StudentHistoryBox extends StatelessWidget {
  Event event = Event();
  StudentHistoryBox(Event e, {super.key}) {
    event = e;
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.today),
      title: Text(
        event.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
      subtitle: Text(
        event.content,
        maxLines: 2,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentRegisterScreen(
            event,
          ),
        ),
      ),
    );
  }
}
