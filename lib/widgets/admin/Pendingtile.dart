import 'package:campus_event_app/widgets/admin/expandedPendingsTile.dart';

import 'package:flutter/material.dart';
import '../../data/ashwin_test.dart';

class Pendingtile extends StatelessWidget {
  final Event events;
  Function func = () {};
  Pendingtile({super.key, required this.events, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => func(events),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(events.img,
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(events.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis)),
                    SizedBox(height: 8),
                    Text(events.content,
                        maxLines: 5,
                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
