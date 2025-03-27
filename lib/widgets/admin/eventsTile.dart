// ignore_for_file: file_names

import 'package:campus_event_app/data/color.dart';
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
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  events.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Text(
                  events.org,
                  style: TextStyle(
                    color: d1,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: d1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(events.img,
                        width: 50, height: 50, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    events.content,
                    maxLines: 4,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: d1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: d1,
                    ),
                    Text(
                      " ${DateFormat('MMMMd').format(events.date)}",
                      style: TextStyle(
                        color: d1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: d1,
                    ),
                    Text(
                      " ${events.start.format(context)}",
                      style: TextStyle(
                        color: d1,
                        fontWeight: FontWeight.w700,
                      ),
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
                    Icon(
                      Icons.location_pin,
                      color: d1,
                    ),
                    Text(
                      " ${events.venue}",
                      style: TextStyle(
                        color: d1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.groups,
                      color: d1,
                    ),
                    Text(
                      " ${events.participants.length}",
                      style: TextStyle(
                        color: d1,
                        fontWeight: FontWeight.w700,
                      ),
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
                      builder: (context) => Expandedtile(eventDesc: events),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(d3),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'View Event Statistics',
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
