import 'package:campus_event_app/data/sneha_test.dart';
import 'package:flutter/material.dart';

class ViewEventPage extends StatefulWidget {
  final Event event;
  const ViewEventPage({required this.event,super.key});

  @override
  State<ViewEventPage> createState() => _ViewEventPageState();
}

class _ViewEventPageState extends State<ViewEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(widget.event.name),
        Text(widget.event.desc)
      ],)
    );
  }
}