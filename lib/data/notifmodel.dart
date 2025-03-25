import 'package:campus_event_app/data/eventmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference notiflist = FirebaseFirestore.instance.collection('orgnotifs');

class Notif {
  String event;
  String msg;
  bool eventExists;
  bool isValid = true;

  Notif({
    required this.event,
    required this.msg,
    required this.eventExists,
  });

  Future<Event> getEvent() async{
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('events').doc(event).get();
    return getEventFromFirestore(doc);
  }

  bool checkIfValid(){
    getEvent().then((e){
      return e.date.isAfter(DateTime.now()) || e.date.isAtSameMomentAs(DateTime.now());
    });
    return true;
    //or we need to add a date for notifs or add date of event to notifs
    // incase event is deleted when declined
  }
}

Notif getNotifFromFirestore(DocumentSnapshot obj) {
    Map<String, dynamic> data = obj.data() as Map<String, dynamic>;
    return Notif(
      event: data['event'] ?? '',
      msg: data['msg'] ?? '',
      eventExists: data['eventExists'] ?? false
    );
  }

  void addNotif(String e, String m, bool ex) async {
    final n = {
      'event': e,
      'msg': m,
      'eventExists': ex,
    };

    await notiflist.doc().set(n);
  }

  Future<List<Notif>> getNotifs() async{
    List<Notif> list=[];
    QuerySnapshot querySnapshot = await notiflist.get();
    for (var doc in querySnapshot.docs){
      var n = getNotifFromFirestore(doc);
      if(n.checkIfValid()){
        list.add(n);
      }
    }
    return list;
  }