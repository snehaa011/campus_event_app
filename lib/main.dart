import 'package:campus_event_app/screens/openscreen.dart';
import 'package:campus_event_app/screens/student/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
