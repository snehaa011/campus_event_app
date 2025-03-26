import 'package:campus_event_app/widgets/admin/expandedTile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/ashwin_test.dart';

class EventsTile extends StatelessWidget {
  final Event events;

  const EventsTile({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(events.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(5)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(events.img,
                        width: 50, height: 50, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(events.content,
                      maxLines: 4,
                      style: TextStyle(overflow: TextOverflow.ellipsis)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    Text(
                      " ${DateFormat('MMMMd').format(events.date)}",
                      style: TextStyle(
                          color: Colors.brown, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    Text(
                      " ${events.start.format(context)}",
                      style: TextStyle(
                          color: Colors.brown, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    Text(
                      " ${events.venue}",
                      style: TextStyle(
                          color: Colors.brown, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.groups),
                    Text(
                      " ${events.participants.length}",
                      style: TextStyle(
                          color: Colors.brown, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Expandedtile(eventDesc: events)));
                },
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    backgroundColor: WidgetStatePropertyAll(Colors.brown)),
                child: Container(
                  width: 300,
                  child: Center(
                    child: Text(
                      'View Event Statstics',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
