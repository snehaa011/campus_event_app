// ignore_for_file: non_constant_identifier_names

import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/eventmodel.dart';
import 'package:campus_event_app/data/venuemodel.dart';
import 'package:campus_event_app/widgets/organiser/dialogbox.dart';
import 'package:flutter/material.dart';

Widget VenueTile(Venue v, bool complete, Function(Venue?) setVenue,
    DateTime? date, context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 233, 233, 233),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            v.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(child: SizedBox()),
          complete
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dd,
                        padding: EdgeInsets.all(10),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Schedule'),
                      onPressed: () async {
                        if (date != null) {
                          List<Event> occupied = await v.getEventsByDate(date);
                          dialogBox(context, occupied);
                        }
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dd,
                        padding: EdgeInsets.all(10),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setVenue(v);
                        Navigator.pop(context);
                      },
                      child: Text('Select'),
                    ),
                  ],
                )
              : Center(
                  child: ElevatedButton(
                    child: Text('Schedule'),
                    onPressed: () async {
                      if (date != null) {
                        List<Event> occupied = await v.getEventsByDate(date);
                        dialogBox(context, occupied);
                      }
                    },
                  ),
                ),
        ],
      ),
    ),
  );
}
