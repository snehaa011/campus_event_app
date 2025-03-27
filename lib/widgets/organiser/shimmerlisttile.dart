// ignore_for_file: non_constant_identifier_names

import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

Widget ShimmerListTile(context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      height: 70,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            height: 20,
            width: 140,
          ),
          ShimmerContainer(
            height: 18,
            width: 200,
          )
        ],
      ),
    ),
  );
}
