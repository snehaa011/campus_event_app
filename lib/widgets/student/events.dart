import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:campus_event_app/widgets/student/eventbox.dart';
import 'package:campus_event_app/widgets/student/filter.dart';
import 'package:flutter/material.dart';

class StudentEvents extends StatefulWidget {
  const StudentEvents({super.key});

  @override
  State<StudentEvents> createState() => _StudentEventsState();
}

class _StudentEventsState extends State<StudentEvents> {
  int i = 0;
  List<Event> list = events;
  List<Event> _list = events;
  void search(String str) {
    Set<Event> s = {};
    s.addAll(list.where((s) => s.name.toLowerCase().contains(str)).toList());
    s.addAll(list.where((s) => s.org.toLowerCase().contains(str)).toList());
    s.addAll(
        list.where((s) => s.venue.name.toLowerCase().contains(str)).toList());
    setState(() {
      _list = s.toList();
    });
  }

  void getAll() {
    setState(() {
      i = 0;
      list = events;
      _list = list;
    });
  }

  void getInterested() {
    setState(() {
      i = 1;
      list = user.interested;
      _list = list;
    });
  }

  void getRegistered() {
    setState(() {
      i = 2;
      list = user.registered;
      _list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: EventSearchBar(search),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                        const Color.fromARGB(36, 121, 85, 72)),
                  ),
                  onPressed: () => {
                    getAll(),
                  },
                  child: Column(
                    children: [
                      Text(
                        "ALL",
                        style: TextStyle(
                          fontWeight:
                              i == 0 ? FontWeight.bold : FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 2,
                        color: i == 0 ? Colors.black : Colors.transparent,
                        width: 20,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                        const Color.fromARGB(36, 121, 85, 72)),
                  ),
                  onPressed: () => {
                    getInterested(),
                  },
                  child: Column(
                    children: [
                      Text(
                        "INTERESTED",
                        style: TextStyle(
                          fontWeight:
                              i == 1 ? FontWeight.bold : FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 2,
                        color: i == 1 ? Colors.black : Colors.transparent,
                        width: 20,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                        const Color.fromARGB(36, 121, 85, 72)),
                  ),
                  onPressed: () => {
                    getRegistered(),
                  },
                  child: Column(
                    children: [
                      Text(
                        "REGISTERED",
                        style: TextStyle(
                          fontWeight:
                              i == 2 ? FontWeight.bold : FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 2,
                        color: i == 2 ? Colors.black : Colors.transparent,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              // width: double.infinity,
              height: 100,
              child: StudentFilter(),
            ),
            SizedBox(
              height: 20,
            ),
            _list.isEmpty
                ? Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "No events found",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        StudentEventBox(_list[index]),
                    itemCount: _list.length,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  ),
          ],
        ),
      ),
    );
  }
}
