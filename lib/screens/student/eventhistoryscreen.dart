// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/widgets/student/historyeventbox.dart';
import 'package:flutter/material.dart';

class StudentEventHistoryScreen extends StatelessWidget {
  List<Event> history = [];
  StudentEventHistoryScreen(List<Event> h, {super.key}) {
    history = h;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Event History",
          style: TextStyle(
            color: d7,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: d7,
          ),
        ),
      ),
      backgroundColor: d1,
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) => StudentHistoryBox(history[index]),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
