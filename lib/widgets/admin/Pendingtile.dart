import 'package:campus_event_app/widgets/admin/expandedPendingsTile.dart';

import 'package:flutter/material.dart';
import '../../data/navaneeth_test.dart';

class Pendingtile extends StatelessWidget {
  final Event events;

  const Pendingtile({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExpandedPendingstile(events: events))),
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
              
              //Image.asset(events.img, width: 50, height: 50, fit: BoxFit.cover),
              Container(
              
                height: 150,
                width: 130,
                decoration: BoxDecoration(color:Colors.brown,borderRadius: BorderRadiusDirectional.circular(10)),
              
              ),
                            SizedBox(width: 10),
                             Container(width: 176,child:
                            Column(
                              children: [
                                Text(events.name,  
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)),
              SizedBox(height: 8),
                               
                                  
                                 Text(content,
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
