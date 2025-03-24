import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/navaneeth_test.dart';

class Expandedtile extends StatelessWidget {
  final Event eventDesc;

  const Expandedtile({super.key, required this.eventDesc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(eventDesc.name),backgroundColor:  Color.fromARGB(255, 212, 208, 210)),
      body: Container(decoration: BoxDecoration(color: const Color.fromARGB(255, 212, 208, 210),
      ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Center(child: Text("Upcoming Events",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500),)),
                 SizedBox(height:10),
                  Stack(
                   children:[
                  
                 
                  // Image.asset(
                  //   eventDesc.img,
                  //   width: double.infinity,
                  //   height: 200,
                  //   fit: BoxFit.cover,
                  // ),
                  Container(       height:320,
                      width: 320,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color:Colors.brown),),
                      
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Text(
                             eventDesc.name,
                             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                                            ),
                        ),],),
                  SizedBox(height: 10),
                  Text(
                    content,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                     Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text("  ${DateFormat('MMMMd').format(eventDesc.date)}",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.w700),),
                      ],
                    ),
                      Row(
                      children: [
                        Icon(Icons.timer),
                        Text("  ${eventDesc.start.format(context)}-${eventDesc.end?.format(context)}",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.w700),),
                      ],
                    ),
                   
                  ],
                ),
                SizedBox(height: 10),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Row(
                      children: [
                        Icon(Icons.location_pin),
                        Text("  ${eventDesc.venue.name}",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.w700),),
                      ],
                    ),
                           Row(
                      children: [
                        Icon(Icons.groups),
                        Text(" ${eventDesc.noOfParticpiants}",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.w700),),
                      ],
                    ),
                     //
                   
                  ],
                ),
                
                SizedBox(height: 10),
          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
