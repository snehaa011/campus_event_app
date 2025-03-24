import 'package:campus_event_app/data/sneha_test.dart';
import 'package:campus_event_app/screens/organiser/eventpage.dart';
import 'package:flutter/material.dart';

Widget EventTile(Event e, context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ViewEventPage(event: e,)));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        padding: EdgeInsets.all(0),
        overlayColor: Colors.brown,
        backgroundColor: const Color.fromARGB(255, 177, 170, 167),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 177, 170, 167),
            borderRadius: BorderRadius.circular(10)),
        height: 120,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  e.name,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      e.venue.name,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      "${e.start.format(context)}-${e.end.format(context)}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      "${e.date.day.toString().padLeft(2, '0')}-${e.date.month.toString().padLeft(2, '0')}-${e.date.year}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
