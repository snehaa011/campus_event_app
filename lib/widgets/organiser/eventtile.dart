import 'package:campus_event_app/data/sneha_test.dart';
import 'package:flutter/material.dart';

Widget EventTile(Event e, context){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 177, 170, 167), borderRadius: BorderRadius.circular(10)),
      height: 120,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(e.name),
            Row(children: [
              Icon(Icons.location_on),
              SizedBox(
                width: 5,
              ),
              Text(e.venue.name)
            ],),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(
                  width: 5,
                ),
                Text(e.end!=null? "${e.start.format(context)}-${e.end.toString()}": "${e.start}")
              ],
            ),
            Row(children: [
                Icon(Icons.access_time),
                SizedBox(
                  width: 5,
                ),
                Text(e.end!=null? "${e.start}-${e.end}": "${e.start}")
              ],)
          ],),
    
        ],
      ),
    ),
  );
}