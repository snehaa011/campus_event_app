// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/data.dart';
import 'package:campus_event_app/widgets/organiser/shimmerlisttile.dart';
import 'package:flutter/material.dart';

class Participants extends StatefulWidget {
  String event = "";

  Participants(this.event, {super.key});

  @override
  State<Participants> createState() => _ParticipantsState();
}

class _ParticipantsState extends State<Participants> {
  List<dynamic> list = [];
  bool loading=true;

  void fetchParticipants() async {
    List<dynamic> l = await admin.fetchParticipants(widget.event);
    if (mounted) {
      setState(() {
        list = l;
      });
    }
    loading=false;
  }

  @override
  void initState() {
    super.initState();
    fetchParticipants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Participants",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.brown,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 212, 208, 210),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 40),
        child: 
        loading?
        ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) => ShimmerListTile(context)
              ):
        list.isEmpty
            ? Center(
                child: Text("No participants"),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(list[index]['name']),
                    subtitle: Text(list[index]['email']),
                  ),
                ),
              ),
      ),
    );
  }
}
