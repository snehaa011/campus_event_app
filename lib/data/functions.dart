import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

Future<String> getUser() async{
  User? currentUser = FirebaseAuth.instance.currentUser;
  String s = "";
  await FirebaseFirestore.instance.collection('organizers').doc(currentUser?.email).get().then((doc) async{
    if (doc.exists){
      var data = doc.data() as Map<String, dynamic>;
      s= data['name'];
    }
  });
  return s;
}
//use await in a future void fn and assign to string s = await getUser()
// or getUser.then((value){ s = value})