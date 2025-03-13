// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/test.dart';
import 'package:campus_event_app/screens/student/registerscreen.dart';
import 'package:flutter/material.dart';

class StudentEventBox extends StatelessWidget {
  String title = "";
  StudentEventBox(String t, {super.key}) {
    title = t;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          title: Text(title),
          backgroundColor: Colors.white,
          initiallyExpanded: true,
          collapsedBackgroundColor: Colors.white,
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
                        builder: (context) => StudentRegisterScreen(title),
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
