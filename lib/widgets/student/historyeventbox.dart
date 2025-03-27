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
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: ListTile(
        tileColor: Color.fromARGB(255, 233, 233, 233),
        contentPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        leading: Icon(
          Icons.today,
          color: d2,
        ),
        title: Text(
          event.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: d1,
          ),
        ),
        subtitle: Text(
          event.content,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: d3,
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
