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
            color: const Color.fromARGB(255, 223, 223, 223),
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
                      style: TextStyle(fontSize: 11),
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
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StudentRegisterScreen(not.event.name),
                    ),
                  ),
                },
                child: Text("Go to event"),
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
