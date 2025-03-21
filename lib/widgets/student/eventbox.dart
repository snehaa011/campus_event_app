// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentEventBox extends StatefulWidget {
  Event event = Event();
  bool inter = false;
  StudentEventBox(Event e, {super.key}) {
    event = e;
  }

  @override
  State<StudentEventBox> createState() => _StudentEventBoxState();
}

class _StudentEventBoxState extends State<StudentEventBox> {
  bool load = true;
  Future<void> interestedStatus() async {
    bool b = await student.checkInterested(
        widget.event.name, currentUser?.email as String);
    if (mounted) {
      setState(() {
        widget.inter = b;
        load = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    interestedStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          title: Text(widget.event.name),
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
                  color: Colors.brown,
                  // child: ClipRRect(
                  //   child: Image.network(
                  //     widget.event.img,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
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
                Text(DateFormat('yMMMd').format(widget.event.date)),
                Spacer(),
                Icon(Icons.alarm),
                SizedBox(
                  width: 5,
                ),
                Text(widget.event.start.format(context)),
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
                Text(widget.event.venue),
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
                  style: bs,
                  onPressed: () async {
                    if (widget.inter) {
                      await student.removeInterested(
                          widget.event.name, currentUser?.email as String);
                    } else {
                      await student.addInterested(
                          widget.event.name, currentUser?.email as String);
                    }
                    await interestedStatus();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Interested",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: widget.inter
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      widget.inter
                          ? Icon(
                              Icons.star,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.star_outline,
                              color: Colors.white,
                            ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: bs,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentRegisterScreen(widget.event),
                      ),
                    ),
                  },
                  child: Text(
                    "View Event",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
