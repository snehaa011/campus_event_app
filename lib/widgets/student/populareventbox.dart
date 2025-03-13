// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/test.dart';
import 'package:flutter/material.dart';

class StudentPopularEventBox extends StatelessWidget {
  String title = "";

  StudentPopularEventBox(String t, {super.key}) {
    title = t;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ExpansionTile(
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
    );
  }
}
