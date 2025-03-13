import 'package:campus_event_app/data/test.dart';
import 'package:flutter/material.dart';

class StudentNotificationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
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
                onPressed: () => {},
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
