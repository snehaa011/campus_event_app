// ignore_for_file: avoid_print

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

  Future<UserClass> getStudent(String email) async {
    UserClass ui = UserClass();
    await students.doc(email).get().then((doc) async {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        ui.name = data['name'];
        ui.email = data['email'];
        ui.branch = data['branch'];
        ui.rollno = data['rollno'];
        ui.phoneno = data['phoneno'];
        ui.history = await getHistory();
        print(ui.history);
      }
    });
    print(ui.name);
    return ui;
  }

  void updatePhoneNumber(String str) async {
    final data = {
      'phoneno': str,
    };
    await students.doc(currentUser?.email).update(data);
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

  Future<List<Event>> getHistory() async {
    List<Event> r = await getRegistered();
    for (Event i in r) {
      if (i.date.compareTo(DateTime.now()) == -1) {
        addHistory(i.name, currentUser?.email as String);
      }
    }

    await students.doc(currentUser?.email).get().then((doc) {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        history = data['history'];
        print(history);
      }
    });
    List<Event> list = [];
    for (String id in history) {
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
      map['desc'],
      TimeOfDay.fromDateTime(map['start'].toDate()),
      map['date'].toDate(),
      map['venue'],
      map['np'],
      (map['regfee'] as num).toDouble(),
      map['img'],
      map['participants'],
    );
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
      map['desc'],
      TimeOfDay.fromDateTime(map['start'].toDate()),
      map['date'].toDate(),
      map['venue'],
      map['np'],
      (map['regfee'] as num).toDouble(),
      map['img'],
      map['participants'],
    );
  }

  Future<List<Event>> getEvents() async {
    List<Event> list = [];
    QuerySnapshot querySnapshot = await events.get();
    for (var doc in querySnapshot.docs) {
      list.add(convert(doc));
    }
    return list;
  }

  Future<void> addRegistration(String name) async {
    final data = {
      'participants': FieldValue.arrayUnion([currentUser?.email])
    };
    // check if it reached max and update staus and maybe send notif
    await events.doc(name).update(data);
  }
}

Events eventer = Events();

class Not {
  Future<List<Notify>> getNotifications() async {
    CollectionReference notifications =
        FirebaseFirestore.instance.collection('notifications');
    QuerySnapshot querySnapshot = await notifications.get();
    List<Notify> list = [];
    for (var doc in querySnapshot.docs) {
      list.add(convert(doc));
    }
    return list;
  }

  Notify convert(QueryDocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return Notify(
      map['title'],
      map['name'],
      map['org'],
      map['content'],
      map['date'].toDate(),
      TimeOfDay.fromDateTime(
        map['time'].toDate(),
      ),
    );
  }

  Future<Event> getEvent(String name) async {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
    QuerySnapshot querySnapshot =
        await events.where(FieldPath.documentId, isEqualTo: name).get();
    var doc = querySnapshot.docs.isNotEmpty ? querySnapshot.docs.first : null;
    return eventer.convert(doc!);
  }
}

Not noti = Not();

class Notify {
  String title = "", name = "", org = "", content = "";
  DateTime date = DateTime(0);
  TimeOfDay time = TimeOfDay.now();
  Notify(this.title, this.name, this.org, this.content, this.date, this.time);
  Notify.i();
}

Future<bool> checkUser(String? docId, String collection) async {
  if (docId == null) return false;
  DocumentSnapshot doc =
      await FirebaseFirestore.instance.collection(collection).doc(docId).get();
  return doc.exists ? true : false;
}

class Admin {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  Future<List<Event>> fetchPendingEvents() async {
    List<Event> list = [];
    QuerySnapshot querySnapshot = await events.get();
    for (var doc in querySnapshot.docs) {
      if (doc.get('status') == "pending") {
        list.add(eventer.convert(doc));
      }
    }
    // print(list);
    return list;
  }

  Future<List<Event>> fetchUpcomingEvents() async {
    List<Event> list = [];
    QuerySnapshot querySnapshot = await events.get();
    for (var doc in querySnapshot.docs) {
      if (doc.get('status') == "active") {
        list.add(eventer.convert(doc));
      }
    }
    // print(list);
    return list;
  }

  void approveEvent(String str) async {
    final data = {'approved': true, 'status': "active"};
    await events.doc(str).update(data);
  }

  void declineEvent(String str) async {
    final data = {'approved': false, 'status': "declined"};
    await events.doc(str).update(data);
  }

  Future<List<dynamic>> getParticipants(List l) async {
    List<dynamic> list = [];
    for (var i in l) {
      await FirebaseFirestore.instance.collection('students').doc(i).get().then((s) {
        list.add({
          'name': s.data()?['name'],
          'email': s.data()?['email'],
        });
      });
    }
    print(list);
    return list;
  }

  Future<List> fetchParticipants(String str) async {
    List<dynamic> list = [];
    await events.doc(str).get().then((s) {
      if (s.exists) {
        var data = s.data() as Map<String, dynamic>;
        list = data['participants'];
        print(list);
        print(data['name']);
      }
    });
    return getParticipants(list);
  }

  void sendNotification(String name, String msg, String org) async {
    await FirebaseFirestore.instance
        .collection('orgnotifs')
        .doc("$name-$org")
        .set({
      'event': name,
      'msg': msg,
      'org': org,
    });
  }
}

Admin admin = Admin();
