import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

Widget ShimmerEventTile(context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 179, 178, 178), 
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Row(children: [
        ShimmerContainer(width: MediaQuery.of(context).size.width * 0.3, height: MediaQuery.of(context).size.width * 0.3,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(height: 24, width: 150,),
            SizedBox(
              height: 5,
            ),
            ShimmerContainer(height: 20, width: 120,),
            SizedBox(
              height: 5,
            ),
            ShimmerContainer(height: 20, width: 120,),
            SizedBox(
              height: 5,
            ),
            ShimmerContainer(height: 20, width: 120,),
        ],),
        )
      ],)
    )
  );
}
