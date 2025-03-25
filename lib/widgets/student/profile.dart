// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/screens/student/eventhistoryscreen.dart';
import 'package:campus_event_app/widgets/student/phonebox.dart';
import 'package:campus_event_app/widgets/student/shimmercontainer.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  bool load = true;
  UserClass user = UserClass();
  TextEditingController tc = TextEditingController();
  void fetch() async {
    UserClass u = await student.getStudent();
    print(u.history);
    if (mounted) {
      setState(() {
        user = u;
        load = false;
      });
    }
  }

  bool b = false;
  void setVal(String str) {
    student.updatePhoneNumber(str);
    if (mounted) {
      setState(() {
        user.phoneno = str;
        b = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    tc.text = user.phoneno;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        load
                            ? ShimmerContainer(
                                height: 40,
                              )
                            : Text(
                                user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        load
                            ? ShimmerContainer(
                                height: 30,
                              )
                            : Text(
                                user.email,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          40,
                        ),
                        child: Image.network(currentUser?.photoURL as String),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Roll No.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  load
                      ? ShimmerContainer(
                          height: 26,
                        )
                      : Text(
                          user.rollno,
                          style: TextStyle(fontSize: 20),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Branch",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  load
                      ? ShimmerContainer(
                          height: 26,
                        )
                      : Text(
                          user.branch,
                          style: TextStyle(fontSize: 20),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone No.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 200,
                            child: StudentPhoneBox(tc, setVal, b),
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.brown),
                          shape: WidgetStatePropertyAll(
                            CircleBorder(),
                          ),
                        ),
                        onPressed: () => {
                          if (mounted)
                            setState(() {
                              b = true;
                            })
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(
                      const Color.fromARGB(36, 121, 85, 72)),
                  surfaceTintColor: WidgetStatePropertyAll(Colors.brown),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StudentEventHistoryScreen(user.history),
                    ),
                  ),
                },
                child: Text(
                  "View event history",
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
