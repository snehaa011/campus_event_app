import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:campus_event_app/widgets/student/eventbox.dart';
import 'package:campus_event_app/widgets/student/filter.dart';
import 'package:campus_event_app/widgets/student/shimmereventbox.dart';
import 'package:flutter/material.dart';

class StudentEvents extends StatefulWidget {
  const StudentEvents({super.key});

  @override
  State<StudentEvents> createState() => _StudentEventsState();
}

class _StudentEventsState extends State<StudentEvents> {
  bool load = true;
  int i = 0;
  List<Event> list = [];
  List<Event> _list = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  void set(List<Event> l) {
    if (mounted) {
      setState(() {
        list = l;
        _list = l;
        load = false;
      });
    }
  }

  void fetchEvents() async {
    List<Event> l = await eventer.getEvents();
    set(l);
  }

  void fetchInterested() async {
    List<Event> l = await student.getInterested();
    set(l);
  }

  void fetchRegistered() async {
    List<Event> l = await student.getRegistered();
    set(l);
  }

  void search(String str) {
    str = str.toLowerCase();
    Set<Event> s = {};
    s.addAll(list.where((s) => s.name.toLowerCase().contains(str)).toList());
    s.addAll(list.where((s) => s.org.toLowerCase().contains(str)).toList());
    s.addAll(list.where((s) => s.venue.toLowerCase().contains(str)).toList());
    if (mounted) {
      setState(() {
        _list = s.toList();
      });
    }
  }

  void searchOrg(String str) {
    str = str.toLowerCase();
    if (mounted) {
      setState(() {
        _list = list.where((s) => s.org.toLowerCase() == str).toList();
      });
    }
  }

  void setVal(int x) {
    if (mounted) {
      setState(() {
        i = x;
      });
    }
  }

  void getAll() {
    if (mounted) {
      setState(() {
        load = true;
      });
    }
    fetchEvents();
    setVal(0);
  }

  void getInterested() {
    if (mounted) {
      setState(() {
        load = true;
      });
    }
    fetchInterested();
    setVal(1);
  }

  void getRegistered() {
    if (mounted) {
      setState(() {
        load = true;
      });
    }
    fetchRegistered();
    setVal(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: dd,
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
                          color: i == 0 ? d7 : Colors.white54,
                        ),
                      ),
                      Container(
                        height: 2,
                        color: i == 0 ? d7 : Colors.transparent,
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
                          color: i == 1 ? d7 : Colors.white54,
                        ),
                      ),
                      Container(
                        height: 2,
                        color: i == 1 ? d7 : Colors.transparent,
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
                          color: i == 2 ? d7 : Colors.white54,
                        ),
                      ),
                      Container(
                        height: 2,
                        color: i == 2 ? d7 : Colors.transparent,
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
              child: StudentFilter(searchOrg),
            ),
            SizedBox(
              height: 20,
            ),
            load
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => StudentShimmerEventBox(),
                    itemCount: 3,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  )
                : _list.isEmpty
                    ? Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.event_busy,
                              size: 80,
                              color: Color.fromARGB(255, 233, 233, 233),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No events found",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 233, 233, 233),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => StudentEventBox(
                          _list[index],
                          key: ValueKey(
                              DateTime.now().millisecondsSinceEpoch + index),
                        ),
                        itemCount: _list.length,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                      )
          ],
        ),
      ),
    );
  }
}
