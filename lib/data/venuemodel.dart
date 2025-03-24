import 'package:campus_event_app/data/eventmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference venues = FirebaseFirestore.instance.collection('venues');

class Venue {
  String id;
  String name;
  String url;
  TimeOfDay open;
  TimeOfDay close;
  List<String> events; // Store event references (document IDs)

  /// **Constructor for Venue**
  Venue({
    required this.id,
    required this.name,
    required this.url,
    required this.open,
    required this.close,
    required this.events,
  });

  /// **Factory method to create a Venue from Firestore**
  factory Venue.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Venue(
      id: doc.id,
      name: data['name'] ?? '',
      url: data['url'] ?? '',
      open: timestampToTimeOfDay(data['open']),
      close: timestampToTimeOfDay(data['close']),
      events: List<String>.from(data['events'] ?? []),
    );
  }

  /// **Check if Venue is Available for a Given Date & Time**
  Future<bool> isAvailable(TimeOfDay start, TimeOfDay end, DateTime date) async {
    if (start.hour < open.hour || end.hour > close.hour) return false;

    List<Event> occupiedEvents = await getEventsByDate(date);
    for (Event e in occupiedEvents) {
      if (!(end.hour <= e.start.hour || start.hour >= e.end.hour)) {
        return false; // Conflict detected
      }
    }
    return true;
  }

  /// **Fetch Events for a Given Date**
  Future<List<Event>> getEventsByDate(DateTime date) async {
    List<Event> eventsList = [];

    for (String eventId in events) {
      DocumentSnapshot eventDoc = await FirebaseFirestore.instance.collection('events').doc(eventId).get();
      if (eventDoc.exists) {
        Event event = Event.fromFirestore(eventDoc);
        if (event.date.isAtSameMomentAs(date)) {
          eventsList.add(event);
        }
      }
    }
    
    eventsList.sort((a, b) => a.start.hour.compareTo(b.start.hour));
    return eventsList;
  }

  //Not sure if its required
  Future<void> addEvent(String eventId) async {
    events.add(eventId);
    await venues.doc(id).update({'events': events});
  }

  /// **Remove Event Reference if Event is Not Approved**
  Future<void> decline(String eventId) async {
    DocumentSnapshot eventDoc = await FirebaseFirestore.instance.collection('events').doc(eventId).get();
    if (eventDoc.exists) {
      Event event = Event.fromFirestore(eventDoc);
      if (!event.approved) {
        events.remove(eventId);
        await venues.doc(id).update({'events': events});
      }
    }
  }
}

/// **Fetch All Venues from Firestore**
Future<List<Venue>> getVenues() async {
  QuerySnapshot querySnapshot = await venues.get();
  return querySnapshot.docs.map((doc) => Venue.fromFirestore(doc)).toList();
}
