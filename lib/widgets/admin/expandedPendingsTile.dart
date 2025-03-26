import 'package:campus_event_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/ashwin_test.dart';

class ExpandedPendingstile extends StatelessWidget {
  final Event events;

  const ExpandedPendingstile({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 212, 208, 210),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.brown,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          events.img,
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
                        events.name,
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
                  events.content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          " ${events.venue}",
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                          " ${DateFormat('MMMMd').format(events.date)}",
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    Text(
                      " ${events.start.format(context)}",
                      style: TextStyle(
                          color: Colors.brown, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        backgroundColor: WidgetStatePropertyAll(Colors.brown)),
                    child: Center(
                      child: Container(
                        height: 45,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.attachment,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'View Attachment',
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                      ),
                    )),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          admin.declineEvent(events.name);
                          admin.sendNotification(
                              events.name, "has been declined", events.org);
                          Navigator.pop(context, "refresh");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Declined ${events.name}"),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                        ),
                        child: Center(
                          child: Container(
                            height: 35,
                            width: 100,
                            child: Row(children: [
                              Icon(
                                Icons.close,
                                color: Colors.brown,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Decline',
                                style: TextStyle(color: Colors.brown),
                              )
                            ]),
                          ),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        admin.approveEvent(events.name);
                        admin.sendNotification(
                            events.name, "has been approved", events.org);
                        Navigator.pop(context, "refresh");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Approved ${events.name}"),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.brown)),
                      child: Center(
                        child: Container(
                          height: 35,
                          width: 100,
                          child: Row(children: [
                            Icon(
                              Icons.check,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Accept',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
