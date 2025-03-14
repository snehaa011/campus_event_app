// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
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
        title: Text("History"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(history[index].name),
          ),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
