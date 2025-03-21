// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentRegisterScreen extends StatefulWidget {
  Event event = Event();
  StudentRegisterScreen(Event e, {super.key}) {
    event = e;
    // student.checkInterested(event.name, currentUser?.email as String);
  }

  @override
  State<StudentRegisterScreen> createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  bool b = false;
  void registeredStatus() async {
    bool r = await student.checkRegistered(
        widget.event.name, currentUser?.email as String);
    if (mounted) {
      setState(() {
        b = r;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    registeredStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Register"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                widget.event.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              color: Colors.brown,
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                child: Image.network(
                  widget.event.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(content),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 5,
                      ),
                      Text(DateFormat('yMMMd').format(widget.event.date)),
                      Spacer(),
                      Icon(Icons.alarm),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.event.start.format(context)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.event.venue),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (DateTime.now().compareTo(widget.event.date) == -1)
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
                        if (!b)
                          {
                            student.addRegistered(widget.event.name,
                                currentUser?.email as String),
                            // user.register(widget.event),
                          },
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("You have successfully registered"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.check,
                                    size: 60,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (mounted)
                          setState(() {
                            b = true;
                          }),
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            b ? "Registered" : "Register",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
