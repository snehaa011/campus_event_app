import 'package:flutter/material.dart';

var content =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}

class Venue {
  String name = "";
  String url = "";
  TimeOfDay open = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay close = TimeOfDay(hour: 0, minute: 0);
  List<Event> events = [];
  Venue(String n, TimeOfDay o, TimeOfDay c, String u) {
    name = n;
    open = o;
    close = c;
    url = u;
  }
  void addEvent(Event v) {
    events.add(v);
  }
  void sortEvents(List<Event> ev){
    ev.sort((a,b){
      if (a.date.compareTo(b.date)==0){
        return a.start.compareTo(b.start);
      }
      return a.date.compareTo(b.date);
    });
  }
  List<Event> getEventsByDate(DateTime reqd){
    List<Event> evd=[];
    evd.addAll(events.where((e) => e.date.compareTo(reqd)==0));
    sortEvents(evd);
    return evd;
  }
  bool checkAvl(TimeOfDay start, TimeOfDay end, DateTime day){
    if (start.compareTo(open)<0 || start.compareTo(close)>=0 || end.compareTo(close)>0){
      return false;
    }
    List<Event> occupied = getEventsByDate(day);
    bool f=true;
    for (Event e in occupied){
      if (start.compareTo(e.start)<0 && end.compareTo(e.start)<=0){
        f=true;
      }
      else if (start.compareTo(e.end)>=0 && end.compareTo(e.end)>0){
        f=true;
      }else{
        f=false;
      }
    }
    return f;
  }
  //sort events on time and find available slots to choose from once a venue is selected
  // if no venue is selected prompt to choose a venue first
  // should we give the option to choose duration and show available times?
  // or let them choose time and say if its available or not (they can check for time availability while choosing venue)
}

Venue ccc = Venue(
    "CCC",
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 11, minute: 45),
    "https://claytonglass.co.uk/wp-content/uploads/2019/04/ed-robertson-ON6Xw8XEUQ8-unsplash-1024x683.jpeg");
Venue ssl = Venue(
    "SSL",
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 11, minute: 45),
    "https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");
Venue oat = Venue(
    "OAT",
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 11, minute: 45),
    "https://claytonglass.co.uk/wp-content/uploads/2019/04/ed-robertson-ON6Xw8XEUQ8-unsplash-1024x683.jpeg");
Venue aud = Venue(
    "Auditorium",
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 11, minute: 45),
    "https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");
Venue nsl = Venue(
    "NSL",
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 11, minute: 45),
    "https://www.ft.com/__origami/service/image/v2/images/raw/ftcms%3Af1627e9c-e2ce-4bad-ab16-1ba4028d97c0?source=next-article&fit=scale-down&quality=highest&width=1440&dpr=1");
Venue ab = Venue(
    "Aryabhatta",
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 20, minute: 0),
    "https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");

List<Venue> allvenue = [ccc,ssl,oat,aud,nsl,ab];
class Event {
  String name = "";
  String org = "";
  String img = "";
  String desc = "";
  bool approved = false;
  String status = "pending"; // active/closed/past/pending
  // upload poster and documents for approval to firebase and retrieve here
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay end = TimeOfDay(hour: 0, minute: 0);
  DateTime date = DateTime(0000);
  late Venue venue;
  int? maxParticpiants;
  // list of Students registered
  double? regfee;
  Event() {}
  Event.fixed(String n, String o, TimeOfDay s, TimeOfDay e, DateTime d, Venue v,
      int? np, double? p, String dp) {
    name = n;
    org = o;
    start = s;
    end = e;
    date = d;
    venue = v;
    maxParticpiants = np;
    regfee = p;
    desc = dp;
    venue.addEvent(this);
  }
  Event.variable(String n, String o, TimeOfDay s, DateTime d, bool i, int np,
      double p, String dp) {
    name = n;
    org = o;
    start = s;
    date = d;
    maxParticpiants = np;
    regfee = p;
    desc = dp;
  }

  void approveEvent(){
    approved=true;
  }

  void updateStatus(){
    status = approved? date.compareTo(DateTime.now())>0? maxParticpiants==null? "active":"closed" : "past" : "pending";
  }
}

Event i = Event.fixed(
    "CoderKombat",
    "CSEA",
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 12, minute: 0),
    DateTime(2025, 4, 2),
    ssl,
    50,
    100,
    content);

Event ii = Event.fixed(
    "Seminar",
    "CSEA",
    TimeOfDay(hour: 16, minute: 0),
    TimeOfDay(hour: 17, minute: 30),
    DateTime(2024, 12, 10),
    ssl,
    100,
    0,
    content);

Event iii = Event.fixed("Quiz", "CSEA", TimeOfDay(hour: 12, minute: 0), TimeOfDay(hour: 12, minute: 30), DateTime(2025,04,24), ssl, 200, 0, content);

List<Event> events = [i,ii,iii];

class Notify{
  Event event=Event();
  String msg = "";
  Notify(){

  }
  Notify.event(Event e, String m){
    event = e;
    msg = m;
  }
}

Notify n1 = Notify.event(i, "has been approved");
Notify n2 = Notify.event(ii, "has reached maximum participants!");

List<Notify> notifications = [n1,n2];