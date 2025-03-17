import 'package:campus_event_app/widgets/organiser/button.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController? _eventName, _desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Create new event')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      controller: _eventName,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 108, 103, 103),
                        hintText: 'Enter event name',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  createButton(
                      Colors.brown, Colors.white, Icons.location_on, 'Venue'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: createButton(Colors.white, Colors.brown,
                              Icons.access_alarm, 'Time')),
                      Expanded(
                          child: createButton(
                              Colors.white, Colors.brown, Icons.event, 'Date')),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: _desc,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 108, 103, 103),
                        hintText: 'Enter description',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  createButton(Colors.white, Colors.brown,
                      Icons.add_circle_outline, 'Set registration fees'),
                  createButton(Colors.brown, Colors.white, Icons.attach_file,
                      'Upload document'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  backgroundColor: const Color.fromARGB(255, 125, 105, 98),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Center(child: Text('Create Event')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
