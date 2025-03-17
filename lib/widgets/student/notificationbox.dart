import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentNotificationBox extends StatelessWidget {
  Notify not = Notify();
  StudentNotificationBox(Notify n, {super.key}) {
    not = n;
  }
  @override
  Widget build(BuildContext context) {
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
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      not.event.org,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Text(
                    DateFormat('MMMEd').format(not.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    not.time.format(context),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                not.event.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                maxLines: 1,
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
                      builder: (context) => StudentRegisterScreen(not.event),
                    ),
                  ),
                },
                child: Text(
                  "Go to event",
                  style: TextStyle(
                    color: Colors.brown,
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
