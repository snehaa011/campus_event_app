import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:campus_event_app/widgets/student/eventcarousel.dart';
import 'package:flutter/material.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
        // scrollDirection: Axis.vertical,
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
            // SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: EdgeInsets.all(20),
              child: EventSearchBar(),
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
            // SizedBox(
            //   height: 15,
            // ),
            EventCarousel()
          ],
        ),
      ),
    );
  }
}
