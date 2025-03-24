import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

CollectionReference events = FirebaseFirestore.instance.collection('events');

class Event {
  String name;
  String org;
  String? img;
  String desc;
  bool approved;
  String status; // active/closed/past/pending
  TimeOfDay start;
  TimeOfDay end;
  DateTime date;
  String venue;
  int? maxParticipants;
  double? regFee;
  List<String>? participants;

  /// **Constructor for creating an Event object**
  Event({
    required this.name,
    required this.org,
    this.img,
    required this.desc,
    required this.approved,
    required this.status,
    required this.start,
    required this.end,
    required this.date,
    required this.venue,
    this.maxParticipants,
    this.regFee,
    this.participants,
  });

  /// **Factory method to create an Event from Firestore**
  factory Event.fromFirestore(DocumentSnapshot obj) {
    Map<String, dynamic> data = obj.data() as Map<String, dynamic>;
    return Event(
      name: data['name'] ?? '',
      org: data['org'] ?? '',
      img: data['img'] ?? '',
      desc: data['desc'] ?? '',
      approved: data['approved'] ?? false,
      status: data['status'] ?? 'pending',
      start: timestampToTimeOfDay(data['start']),
      end: timestampToTimeOfDay(data['end']),
      date: (data['date'] as Timestamp).toDate(),
      venue: data['venue'],
      maxParticipants: data['np'],
      regFee: data['regfee']?.toDouble(),
      participants: List<String>.from(data['participants'] ?? []),
    );
  }

  Future<void> addEvent() async {
    final event = {
      'name': name,
      'org': org,
      'img': img,
      'desc': desc,
      'approved': approved,
      'status': status,
      'start': timeOfDayToTimestamp(start),
      'end': timeOfDayToTimestamp(end),
      'date': Timestamp.fromDate(date),
      'venue': venue,
      'np': maxParticipants,
      'regfee': regFee,
      'participants': participants ?? [],
    };

    await events.doc(name).set(event);
    await FirebaseFirestore.instance.collection('venues').doc(venue).update({'events': FieldValue.arrayUnion([name])});
  }

  /// **Method to approve an event in Firestore**
  Future<void> approve() async {
    final docRef = FirebaseFirestore.instance.collection('events').doc(name);
    await docRef.update({'approved': true});
    approved = true;
    await updateStatus();
  }

  /// **Method to update the event status in Firestore**
  Future<void> updateStatus() async {
    String newStatus;

    if (approved) {
      if (date.isAfter(DateTime.now())) {
        newStatus =
            ((participants?.length ?? 0) < (maxParticipants ?? double.infinity))
                ? "active"
                : "closed";
      } else {
        newStatus = "past";
      }
    } else {
      newStatus = "pending";
    }

    // Update Firestore
    await FirebaseFirestore.instance.collection('events').doc(name).update({
      'status': newStatus,
    });

    // Update local object
    status = newStatus;
  }
}

Future<List<Event>> getEvents() async {
  List<Event> list = [];
  QuerySnapshot querySnapshot = await events.get();
  for (var doc in querySnapshot.docs) {
    list.add(Event.fromFirestore(doc));
  }
  return list;
}

Future<void> createEvent() async{
  Event newEvent = Event(
    name: "Flutter Workshop",
    org: "GDSC",
    img: "https://example.com/poster.jpg",
    desc: "Learn Flutter with hands-on coding!",
    approved: false,
    status: "pending",
    start: TimeOfDay(hour: 10, minute: 0),
    end: TimeOfDay(hour: 12, minute: 0),
    date: DateTime(2025, 4, 15),
    venue: "Auditorium",
    maxParticipants: 100,
    regFee: 10.0,
    participants: [],
  );

  newEvent.addEvent(); // Add to Firestore
}
