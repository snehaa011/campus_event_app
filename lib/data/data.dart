import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

User? currentUser = FirebaseAuth.instance.currentUser;
Map<String, String> branch = {
  'cs': 'CSE',
  'ec': 'ECE',
  'ee': 'EEE',
  'me': 'MECH',
  'ce': 'CIVIL'
};

class Student {
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  List<dynamic> interested = [];
  List<dynamic> registered = [];
  List<dynamic> history = [];

  Future<bool> checkStudent(String? docId) async {
    if (docId == null) return false;
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('students')
        .doc(docId)
        .get();
    return doc.exists ? true : false;
  }

  Future<UserClass> getStudent() async {
    UserClass ui = UserClass();
    await students.doc(currentUser?.email).get().then((doc) {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        ui.name = data['name'];
        ui.email = data['email'];
        ui.branch = data['branch'];
        ui.rollno = data['rollno'];
        ui.phoneno = data['phoneno'];
        // ui.history = data['history'];
      }
    });
    print(ui.name);
    return ui;
  }

  void addStudent(String email, String name) async {
    final student = {
      'name': name,
      'email': email,
      'rollno': email
          .substring(email.indexOf('_') + 1, email.indexOf('@'))
          .toUpperCase(),
      'branch': branch[
          email.substring(email.indexOf('_') + 8, email.indexOf('_') + 10)],
      'phoneno': "",
      'interested': [],
      'registered': [],
      'history': []
    };
    await students.doc(email).set(student);
  }

  Future<void> addInterested(String str, String email) async {
    final data = {
      'interested': FieldValue.arrayUnion([str])
    };
    await students.doc(email).update(data);
  }

  Future<void> removeInterested(String str, String email) async {
    final data = {
      'interested': FieldValue.arrayRemove([str])
    };
    await students.doc(email).update(data);
  }

  Future<void> addRegistered(String str, String email) async {
    final data = {
      'registered': FieldValue.arrayUnion([str])
    };
    await students.doc(email).update(data);
  }

  Future<void> addHistory(String str, String email) async {
    final data = {
      'history': FieldValue.arrayUnion([str])
    };
    await students.doc(email).update(data);
  }

  Future<bool> checkInterested(String str, String email) async {
    Map<String, dynamic> data = {};
    await students.doc(email).get().then((doc) {
      if (doc.exists) {
        data = doc.data() as Map<String, dynamic>;
        interested = data['interested'];
      }
    });
    // print(
    // "--------------------------\ncheckInterested()\ninterested = $interested\n$str\n${interested.contains(str)}\n------------------------------------\n\n");
    return interested.contains(str);
  }

  Future<bool> checkRegistered(String str, String email) async {
    Map<String, dynamic> data = {};
    await students.doc(email).get().then((doc) {
      if (doc.exists) {
        data = doc.data() as Map<String, dynamic>;
        registered = data['registered'];
      }
    });
    return registered.contains(str);
  }

  Future<List<Event>> getInterested() async {
    List<Event> list = [];
    for (String id in interested) {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection("events").doc(id).get();
      if (doc.exists) {
        list.add(convert(doc));
      }
    }
    return list;
  }

  Future<List<Event>> getRegistered() async {
    await students.doc(currentUser?.email).get().then((doc) {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        registered = data['registered'];
      }
    });
    List<Event> list = [];
    for (String id in registered) {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection("events").doc(id).get();
      if (doc.exists) {
        list.add(convert(doc));
      }
    }
    return list;
  }

  Event convert(DocumentSnapshot obj) {
    Map<String, dynamic> map = obj.data() as Map<String, dynamic>;
    return Event.i(
        map['name'],
        map['org'],
        TimeOfDay.fromDateTime(map['start'].toDate()),
        map['date'].toDate(),
        map['venue'],
        map['np'],
        map['regfee'],
        map['img']);
  }
}

Student student = Student();

class Events {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  Event convert(QueryDocumentSnapshot obj) {
    Map<String, dynamic> map = obj.data() as Map<String, dynamic>;
    return Event.i(
        map['name'],
        map['org'],
        TimeOfDay.fromDateTime(map['start'].toDate()),
        map['date'].toDate(),
        map['venue'],
        map['np'],
        map['regfee'],
        map['img']);
  }

  Future<List<Event>> getEvents() async {
    List<Event> list = [];
    QuerySnapshot querySnapshot = await events.get();
    for (var doc in querySnapshot.docs) {
      list.add(convert(doc));
    }
    return list;
  }
}

Events eventer = Events();
