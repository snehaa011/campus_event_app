import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:campus_event_app/widgets/student/eventcarousel.dart';
import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  List<Event> list = [];
  List<Event> _list = [];
  void fetchEvents() async {
    List<Event> l = await eventer.getEvents();
    setState(() {
      list = l;
      _list = l;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  void search(String str) {
    Set<Event> s = {};
    s.addAll(list.where((s) => s.name.toLowerCase().contains(str)).toList());
    s.addAll(list.where((s) => s.org.toLowerCase().contains(str)).toList());
    s.addAll(list.where((s) => s.venue.toLowerCase().contains(str)).toList());
    setState(() {
      _list = s.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Stay tuned about the latest events",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: EventSearchBar(search),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Popular Events",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            _list.isEmpty
                ? Container(
                    width: double.infinity,
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
                : EventCarousel(_list)
          ],
        ),
      ),
    );
  }
}
