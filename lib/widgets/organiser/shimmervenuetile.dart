// ignore_for_file: non_constant_identifier_names

import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

Widget ShimmerVenueTile(context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 233, 233, 233),
      ),
      height: 60,
      child: Row(
        children: [
          ShimmerContainer(
            height: 18,
            width: 80,
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShimmerContainer(
                height: 24,
                width: 70,
              ),
              ShimmerContainer(
                height: 24,
                width: 70,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
