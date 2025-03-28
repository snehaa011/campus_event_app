import 'package:flutter/material.dart';

var content =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

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
Venue def = Venue(
    "",
    TimeOfDay(hour: 0, minute: 0),
    TimeOfDay(hour: 0, minute: 0),
    "https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");

class Event {
  //name,org,img,ts,te,date,venue,interested,no.of participants,regfee
  String name = "";
  String org = "";
  String img = "";
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay? end;
  DateTime date = DateTime(0000);
  Venue venue = def;
  bool interested = false;
  int noOfParticpiants = 1;
  double regfee = 0;
  Event();
  Event.i(String n, String o, TimeOfDay s, TimeOfDay e, DateTime d, Venue v,
      bool i, int np, double p, String im) {
    name = n;
    org = o;
    start = s;
    end = e;
    date = d;
    venue = v;
    interested = i;
    noOfParticpiants = np;
    regfee = p;
    img = im;
  }
  Event.ii(String n, String o, TimeOfDay s, DateTime d, bool i, int np,
      double p, String im) {
    name = n;
    org = o;
    start = s;
    date = d;
    interested = i;
    noOfParticpiants = np;
    regfee = p;
    img = im;
  }
}

Event i = Event.i(
  "CoderKombat",
  "CSEA",
  TimeOfDay(hour: 9, minute: 0),
  TimeOfDay(hour: 12, minute: 0),
  DateTime(2024, 12, 23),
  ssl,
  false,
  2,
  100,
  "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
);
Event ii = Event.i(
  "Random bullshit nigga event",
  "CSEA",
  TimeOfDay(hour: 9, minute: 0),
  TimeOfDay(hour: 12, minute: 0),
  DateTime(2024, 12, 19),
  nsl,
  false,
  1,
  100,
  "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
);
Event iii = Event.ii(
  "Workshop about IoT Devices",
  "IEEE",
  TimeOfDay(hour: 19, minute: 0),
  DateTime(2024, 12, 17),
  false,
  1,
  100,
  "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
);

Event iv = Event.i(
  "EventP",
  "CEA",
  TimeOfDay(hour: 9, minute: 0),
  TimeOfDay(hour: 12, minute: 0),
  DateTime(2024, 12, 21),
  oat,
  false,
  1,
  100,
  "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
);
Event v = Event.i(
  "EventQ",
  "MEA",
  TimeOfDay(hour: 9, minute: 0),
  TimeOfDay(hour: 12, minute: 0),
  DateTime(2024, 12, 24),
  aud,
  false,
  1,
  100,
  "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
);
Event vi = Event.i(
  "EVentR",
  "EEA",
  TimeOfDay(hour: 19, minute: 0),
  TimeOfDay(hour: 21, minute: 0),
  DateTime(2024, 12, 25),
  oat,
  false,
  1,
  100,
  "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
);
List<Event> events = [i, ii, iii, iv, v, vi];
