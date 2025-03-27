// ignore_for_file: use_key_in_widget_constructors

import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

class OrganizerShimmerNotifBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: double.infinity,
              height: 18,
              borderRadius: 5,
            ),
            SizedBox(
              height: 10,
            ),
            ShimmerContainer(
              width: 100,
              height: 18,
              borderRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
