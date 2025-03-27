// ignore_for_file: avoid_print

import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String name = "";
  String org = "";
  String img = "";
  String content = "";
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay? end;
  DateTime date = DateTime(0000);
  String venue = "";
  int noOfParticpiants = 1;
  List<dynamic> participants = [];
  double regfee = 0;
  Event();
  Event.i(String n, String o, String c, TimeOfDay s, DateTime d, String v,
      int np, double p, String im, List<dynamic> l) {
    name = n;
    org = o;
    content = c;
    start = s;
    date = d;
    venue = v;
    noOfParticpiants = np;
    regfee = p;
    img = im;
    participants = l;
  }
  Event.ii(String n, String o, String c, TimeOfDay s, DateTime d, int np,
      double p, String im, List<dynamic> l) {
    name = n;
    org = o;
    content = c;
    start = s;
    date = d;
    noOfParticpiants = np;
    regfee = p;
    img = im;
    participants = l;
  }
}

class UserClass {
  String name = "",
      email = "",
      rollno = "",
      batch = "",
      branch = "",
      phoneno = "",
      lv = "";
  List<Event> interested = [];
  List<Event> registered = [];
  List<Event> history = [];
  UserClass();
  UserClass.i(n, e, r, ba, br, ph) {
    name = n;
    email = e;
    rollno = r;
    batch = ba;
    branch = br;
    phoneno = ph;
  }
  void addInterested(Event e) {
    interested.add(e);
  }

  void removeInterested(Event e) {
    interested.remove(e);
  }

  void register(Event e) {
    registered.add(e);
  }

  void participated(Event e) {
    history.add(e);
  }
}

List<String> org = ['CSEA', 'ECEA', 'IEEE', 'MEA', 'CEA', 'EEA'];

void fetchDocument() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot doc = await firestore.collection('test').doc('test').get();
  if (doc.exists) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    print("Name: ${data['text']}");
  } else {
    print("Document does not exist");
  }
}

ButtonStyle bs = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(d2),
  overlayColor: WidgetStatePropertyAll(const Color.fromARGB(36, 121, 85, 72)),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  surfaceTintColor: WidgetStatePropertyAll(Colors.brown),
);
ButtonStyle lgn = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(
    d3,
  ),
);
