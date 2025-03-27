// ignore_for_file: must_be_immutable, file_names

import 'package:campus_event_app/data/color.dart';
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
            color: const Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: double.infinity,
                width: 140,
                decoration: BoxDecoration(
                  color: d1,
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    events.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      events.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: d1,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      events.org,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        color: dd,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      events.content,
                      maxLines: 4,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: dd,
                      ),
                    ),
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
