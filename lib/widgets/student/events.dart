import 'package:campus_event_app/data/test.dart';
import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:campus_event_app/widgets/student/eventbox.dart';
import 'package:campus_event_app/widgets/student/filter.dart';
import 'package:flutter/material.dart';

class StudentEvents extends StatefulWidget {
  @override
  State<StudentEvents> createState() => _StudentEventsState();
}

class _StudentEventsState extends State<StudentEvents> {
  List list = l1;
  void getAll() {
    setState(() {
      list = l1;
    });
  }

  void getInterested() {
    setState(() {
      list = l2;
    });
  }

  void getRegistered() {
    setState(() {
      list = l3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.yellow,
      child: SingleChildScrollView(
        child: Column(
          children: [
            EventSearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => {
                    getAll(),
                  },
                  child: Text("ALL"),
                ),
                TextButton(
                  onPressed: () => {
                    getInterested(),
                  },
                  child: Text("INTERESTED"),
                ),
                TextButton(
                  onPressed: () => {
                    getRegistered(),
                  },
                  child: Text("REGISTERED"),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              // width: double.infinity,
              height: 80,
              child: StudentFilter(),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => StudentEventBox(list[index]),
              itemCount: list.length,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
            ),
          ],
        ),
      ),
    );
  }
}
