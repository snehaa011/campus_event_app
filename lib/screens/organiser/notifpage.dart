import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/functions.dart';
import 'package:campus_event_app/data/notifmodel.dart';
import 'package:campus_event_app/widgets/organiser/notifbox.dart';
import 'package:campus_event_app/widgets/organiser/shimmernotifbox.dart';
import 'package:flutter/material.dart';

class ViewNotificationPage extends StatefulWidget {
  const ViewNotificationPage({super.key});

  @override
  State<ViewNotificationPage> createState() => _ViewNotificationPageState();
}

class _ViewNotificationPageState extends State<ViewNotificationPage> {
  bool load = true;
  List<Notif> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    String user = await getUser();
    List<Notif> l = await getNotifs(user);
    if (mounted) {
      setState(() {
        list = l;
        load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dd,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: d7,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: dd,
        child: SingleChildScrollView(
          child: load
              ? ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => OrganizerShimmerNotifBox(),
                )
              : ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => NotificationBox(
                    list[index],
                  ),
                ),
        ),
      ),
    );
  }
}
