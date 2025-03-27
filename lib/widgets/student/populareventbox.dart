// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';

class StudentPopularEventBox extends StatefulWidget {
  Event event = Event();
  StudentPopularEventBox(Event e, {super.key}) {
    event = e;
  }

  @override
  State<StudentPopularEventBox> createState() => _StudentPopularEventBoxState();
}

class _StudentPopularEventBoxState extends State<StudentPopularEventBox> {
  bool inter = false;
  Future<void> interestedStatus() async {
    bool b = await student.checkInterested(
        widget.event.name, currentUser?.email as String);
    if (mounted) {
      setState(() {
        inter = b;
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
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            decoration: BoxDecoration(
              color: dd,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.event.name,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: d6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: d1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
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
                  widget.event.content,
                  maxLines: 5,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    color: Colors.white60,
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
                        overlayColor: WidgetStatePropertyAll(d7),
                      ),
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
                        "View event",
                        style: TextStyle(
                          color: d3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: bs,
                      onPressed: () => {
                        if (mounted)
                          setState(() {
                            if (inter) {
                              inter = false;
                              student.removeInterested(widget.event.name,
                                  currentUser?.email as String);
                            } else {
                              inter = true;
                              student.addInterested(widget.event.name,
                                  currentUser?.email as String);
                            }
                          }),
                      },
                      child: Row(
                        children: [
                          Text(
                            "Interested",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  inter ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          inter
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
          Spacer(),
        ],
      ),
    );
  }
}
