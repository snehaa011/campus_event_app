// ignore_for_file: file_names

import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/widgets/admin/participants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/ashwin_test.dart';

class Expandedtile extends StatelessWidget {
  final Event eventDesc;

  const Expandedtile({super.key, required this.eventDesc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dd,
      appBar: AppBar(
        // title: Text(eventDesc.name),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: d7,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //     child: Text(
                //   "Upcoming Events",
                //   style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                // )),
                Text(
                  eventDesc.name,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: d4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      eventDesc.img,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  eventDesc.content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(242, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: d4,
                        ),
                        Text(
                          "  ${DateFormat('MMMMd').format(eventDesc.date)}",
                          style: TextStyle(
                            color: d4,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: d4,
                        ),
                        Text(
                          "  ${eventDesc.start.format(context)}",
                          style: TextStyle(
                            color: d4,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: d4,
                        ),
                        Text(
                          "  ${eventDesc.venue}",
                          style: TextStyle(
                            color: d4,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.groups,
                          color: d4,
                        ),
                        Text(
                          " ${eventDesc.participants.length}",
                          style: TextStyle(
                            color: d4,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Participants(eventDesc.name),
                      ),
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: d3,
                    ),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Show participants",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
