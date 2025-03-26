// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/widgets/admin/eventsTile.dart';

import 'package:flutter/material.dart';

import '../../data/ashwin_test.dart';

class EventStatsPage extends StatefulWidget {
  const EventStatsPage({super.key});

  @override
  State<EventStatsPage> createState() => _EventStatsPageState();
}

class _EventStatsPageState extends State<EventStatsPage> {
  List<Event> list = [];
  bool load = true;
  void fetchUpcomingEvents() async {
    List<Event> l = await admin.fetchUpcomingEvents();
    setState(() {
      list = l;
      load = false;
    });
    print(l);
  }

  @override
  void initState() {
    load = true;
    super.initState();
    fetchUpcomingEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 212, 208, 210)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
            )),
            SizedBox(height: 10),
            SizedBox(height: 10),
            load
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) => EventsTile(
                      events: list[index],
                      key: ValueKey(
                        DateTime.now().millisecondsSinceEpoch + index,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  ),
          ],
        ),
      ),
    );
  }
}
