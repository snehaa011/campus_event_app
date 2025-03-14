// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:flutter/material.dart';

class StudentPopularEventBox extends StatelessWidget {
  Event event = Event();

  StudentPopularEventBox(Event e, {super.key}) {
    event = e;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        // childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        // title: Text(event.name),
        // backgroundColor: const Color.fromARGB(255, 223, 223, 223),
        // initiallyExpanded: true,
        // collapsedBackgroundColor: const Color.fromARGB(255, 223, 223, 223),
        // collapsedShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 223, 223),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              event.name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              content,
              maxLines: 5,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 15,
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
