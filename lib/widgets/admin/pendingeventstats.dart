// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/widgets/admin/expandedPendingsTile.dart';
import 'package:campus_event_app/widgets/admin/pendingtile.dart';

import 'package:flutter/material.dart';

import '../../data/ashwin_test.dart';

class PendingEventStats extends StatefulWidget {
  const PendingEventStats({super.key});

  @override
  State<PendingEventStats> createState() => _PendingEventStatsState();
}

class _PendingEventStatsState extends State<PendingEventStats> {
  List<Event> list = [];
  bool load = true;

  void navigate(Event e) async {
    String r = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpandedPendingstile(events: e),
      ),
    );
    if (r == 'refresh') {
      print("polayadimwone");
      setState(() {
        load = true;
      });
      fetchPendingEvents();
    }
  }

  void fetchPendingEvents() async {
    List<Event> l = await admin.fetchPendingEvents();
    if (mounted) {
      setState(() {
        list = l;
        load = false;
      });
    }
  }

  @override
  void initState() {
    load = true;
    super.initState();
    fetchPendingEvents();
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
              'Pending Requests',
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
                    itemBuilder: (context, index) => Pendingtile(
                      events: list[index],
                      func: navigate,
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  ),
          ],
        ),
      ),
    );
  }
}
