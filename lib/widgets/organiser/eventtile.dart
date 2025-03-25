import 'package:campus_event_app/data/eventmodel.dart';
import 'package:campus_event_app/screens/organiser/eventpage.dart';
import 'package:flutter/material.dart';

Widget EventTile(Event e, context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewEventPage(
                      event: e,
                    )));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        padding: EdgeInsets.all(0),
        overlayColor: const Color.fromARGB(255, 95, 95, 95),
        backgroundColor: const Color.fromARGB(255, 179, 178, 178),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 177, 170, 167),
            borderRadius: BorderRadius.circular(10)),
        // height: 170,
        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                e.img,
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.name,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: MediaQuery.of(context).size.width * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        e.venue,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: MediaQuery.of(context).size.width * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        "${e.start.format(context)}-${e.end.format(context)}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: MediaQuery.of(context).size.width * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        "${e.date.day.toString().padLeft(2, '0')}-${e.date.month.toString().padLeft(2, '0')}-${e.date.year}",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.035),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
