import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}

Timestamp timeOfDayToTimestamp(TimeOfDay time) {
  DateTime dateTime = DateTime(1970, 1, 1, time.hour, time.minute);
  return Timestamp.fromDate(dateTime);
}

TimeOfDay timestampToTimeOfDay(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
}
