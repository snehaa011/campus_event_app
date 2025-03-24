
import 'package:campus_event_app/widgets/admin/Pendingtile.dart';
import 'package:campus_event_app/widgets/admin/eventsTile.dart';

import 'package:flutter/material.dart';

import '../../data/navaneeth_test.dart';

class EventStatsPage extends StatefulWidget {
  final int flag;
  const EventStatsPage({super.key,required this.flag});

  @override
  State<EventStatsPage> createState() => _EventStatsPageState();
}

class _EventStatsPageState extends State<EventStatsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 212, 208, 210)),
        child: SingleChildScrollView(
          child: Column(
            children: [
        
                Center(child: Text( widget.flag==0?'Upcoming Events':'Pending Requests',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500),)),
                 SizedBox(height:10),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return widget.flag==0?EventsTile(events: events[index]):Pendingtile(events: events[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
