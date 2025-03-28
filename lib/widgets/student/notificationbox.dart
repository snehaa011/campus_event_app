// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentNotificationBox extends StatelessWidget {
  Notify not = Notify.i();
  Event event = Event();
  StudentNotificationBox(Notify n, {super.key}) {
    not = n;
  }
  void getEvent() async {
    event = await noti.getEvent(not.name);
    // print(event.name);
  }

  @override
  Widget build(BuildContext context) {
    getEvent();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      color: d7,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      not.org,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: dd,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    DateFormat('MMMEd').format(not.date),
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    not.time.format(context),
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                not.title,
                style: TextStyle(
                  color: dd,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                not.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                not.content,
                style: TextStyle(
                  color: d1,
                ),
                // maxLines: 1,
              ),
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.all(0),
                  ),
                  overlayColor: WidgetStatePropertyAll(
                    const Color.fromARGB(14, 121, 85, 72),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentRegisterScreen(event),
                    ),
                  ),
                },
                child: Text(
                  "Go to event",
                  style: TextStyle(
                    color: d2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
