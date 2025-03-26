// ignore_for_file: file_names

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
      backgroundColor: Color.fromARGB(255, 212, 208, 210),
      appBar: AppBar(
          // title: Text(eventDesc.name),
          backgroundColor: Color.fromARGB(255, 212, 208, 210)),
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
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.brown),
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
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        eventDesc.name,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  eventDesc.content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                          "  ${DateFormat('MMMMd').format(eventDesc.date)}",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                        ),
                        Text(
                          "  ${eventDesc.start.format(context)}",
                          style: TextStyle(
                            color: Colors.brown,
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
                        Icon(Icons.location_pin),
                        Text(
                          "  ${eventDesc.venue}",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.groups),
                        Text(
                          " ${eventDesc.participants.length}",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          const Color.fromARGB(43, 121, 85, 72),
                        ),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Participants(eventDesc.name),
                          ),
                        ),
                      },
                      child: Text(
                        "Show participants",
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
