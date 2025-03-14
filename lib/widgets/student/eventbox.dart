// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentEventBox extends StatelessWidget {
  Event event = Event();
  StudentEventBox(Event e, {super.key}) {
    event = e;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          title: Text(event.name),
          backgroundColor: const Color.fromARGB(255, 223, 223, 223),
          initiallyExpanded: true,
          collapsedBackgroundColor: const Color.fromARGB(255, 223, 223, 223),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: ClipRRect(
                    child: Image.network(
                      event.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    content,
                    maxLines: 5,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(
                  width: 5,
                ),
                Text(DateFormat('yMMMd').format(event.date)),
                Spacer(),
                Icon(Icons.alarm),
                SizedBox(
                  width: 5,
                ),
                Text(event.start.format(context)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 5,
                ),
                Text(event.venue.name),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  child: Row(
                    children: [
                      Text("Interested"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.star_outline),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentRegisterScreen(event.name),
                      ),
                    ),
                  },
                  child: Text("Register"),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
