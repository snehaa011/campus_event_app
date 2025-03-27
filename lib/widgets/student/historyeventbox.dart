// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';

class StudentHistoryBox extends StatelessWidget {
  Event event = Event();
  StudentHistoryBox(Event e, {super.key}) {
    event = e;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListTile(
        tileColor: dd,
        contentPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        leading: Icon(
          Icons.today,
          color: d7,
        ),
        title: Text(
          event.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          event.content,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white70,
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
      ),
    );
  }
}
