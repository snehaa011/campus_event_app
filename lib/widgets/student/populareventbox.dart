// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';

class StudentPopularEventBox extends StatefulWidget {
  Event event = Event();
  bool inter = false;
  StudentPopularEventBox(Event e, {super.key}) {
    event = e;
    inter = user.interested.contains(event);
  }

  @override
  State<StudentPopularEventBox> createState() => _StudentPopularEventBoxState();
}

class _StudentPopularEventBoxState extends State<StudentPopularEventBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 223, 223),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              widget.event.name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.red,
              child: ClipRRect(
                child: Image.network(
                  widget.event.img,
                  fit: BoxFit.cover,
                ),
              ),
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
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                        const Color.fromARGB(36, 121, 85, 72)),
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentRegisterScreen(widget.event.name),
                      ),
                    ),
                  },
                  child: Text(
                    "View event",
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.brown),
                    overlayColor: WidgetStatePropertyAll(
                        const Color.fromARGB(36, 121, 85, 72)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    surfaceTintColor: WidgetStatePropertyAll(Colors.brown),
                  ),
                  onPressed: () => {
                    setState(() {
                      if (widget.inter) {
                        widget.inter = false;
                        user.removeInterested(widget.event);
                      } else {
                        widget.inter = true;
                        user.addInterested(widget.event);
                      }
                    }),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
