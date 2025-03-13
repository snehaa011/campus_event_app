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
      color: Colors.red,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
        // scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stay tuned about the latest events",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            EventSearchBar(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Popular Events",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            EventCarousel()
          ],
        ),
      ),
    );
  }
}
