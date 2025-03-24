import 'package:campus_event_app/data/sneha_test.dart';
import 'package:campus_event_app/screens/LoginScreen.dart';
import 'package:campus_event_app/screens/organiser/createevent.dart';
import 'package:campus_event_app/screens/organiser/notifpage.dart';
import 'package:campus_event_app/widgets/organiser/eventtile.dart';
import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class OrganiserHomePage extends StatefulWidget {
  const OrganiserHomePage({super.key});

  @override
  State<OrganiserHomePage> createState() => _OrganiserHomePageState();
}

class _OrganiserHomePageState extends State<OrganiserHomePage> {
  List<Event> list = events;
  late List<Event> resultlist;
  int p = 0;

  @override
  void initState() {
    super.initState();
    getActive();
  }

  void search(String str) {
    str = str.toLowerCase();
    Set<Event> s = {};
    s.addAll(list.where((s) => s.name.toLowerCase().contains(str)).toList());
    s.addAll(list.where((s) => s.date.toString().contains(str)).toList());
    s.addAll(
        list.where((s) => s.venue.name.toLowerCase().contains(str)).toList());
    setState(() {
      resultlist = s.toList();
    });
  }

  void updateEventStatus() {
    for (var e in list) {
      e.approved = true; //to be removed
      e.updateStatus();
    }
  }

  void getActive() {
    Set<Event> s = {};
    p = 0;
    updateEventStatus();
    s.addAll(list.where((e) => e.status == 'active' || e.status == 'closed'));
    setState(() {
      resultlist = s.toList();
    });
  }

  void getPast() {
    Set<Event> s = {};
    p = 1;
    updateEventStatus();
    s.addAll(list.where((e) => e.status == 'past'));
    setState(() {
      resultlist = s.toList();
    });
  }

  void getPending() {
    Set<Event> s = {};
    p = 2;
    updateEventStatus();
    s.addAll(list.where((e) => e.status == 'pending'));
    setState(() {
      resultlist = s.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organisation", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewNotificationPage(),
                ),
              );
            },
            icon: Icon(
              Icons.notifications_none,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.logout, size: 28,),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            elevation: 10,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateEvent(),
                ),
              );
            },
            child: Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: EventSearchBar(search),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          const Color.fromARGB(36, 121, 85, 72)),
                    ),
                    onPressed: () => {getActive()},
                    child: Column(
                      children: [
                        Text(
                          "Active",
                          style: TextStyle(
                            fontWeight:
                                p == 0 ? FontWeight.bold : FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 2,
                          color: p == 0 ? Colors.black : Colors.transparent,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          const Color.fromARGB(36, 121, 85, 72)),
                    ),
                    onPressed: () => {getPast()},
                    child: Column(
                      children: [
                        Text(
                          "Past",
                          style: TextStyle(
                            fontWeight:
                                p == 1 ? FontWeight.bold : FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 2,
                          color: p == 1 ? Colors.black : Colors.transparent,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          const Color.fromARGB(36, 121, 85, 72)),
                    ),
                    onPressed: () => {getPending()},
                    child: Column(
                      children: [
                        Text(
                          "Pending",
                          style: TextStyle(
                            fontWeight:
                                p == 2 ? FontWeight.bold : FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 2,
                          color: p == 2 ? Colors.black : Colors.transparent,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              resultlist.isEmpty
                  ? Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Icon(
                            Icons.event_busy,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No events found",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          EventTile(resultlist[index], context),
                      itemCount: resultlist.length,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
