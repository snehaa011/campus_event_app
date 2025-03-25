import 'package:campus_event_app/data/eventmodel.dart';
import 'package:campus_event_app/data/functions.dart';
import 'package:campus_event_app/data/venuemodel.dart';
import 'package:campus_event_app/screens/organiser/venue.dart';
import 'package:campus_event_app/widgets/organiser/button.dart';
import 'package:campus_event_app/widgets/organiser/datepicker.dart';
import 'package:campus_event_app/widgets/organiser/infosheet.dart';
import 'package:flutter/material.dart';
import 'package:campus_event_app/widgets/organiser/timepicker.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _eventName = TextEditingController(),
      _desc = TextEditingController(),
      _img = TextEditingController();
  String? name, desc;
  TimeOfDay? start, end;
  DateTime? date;
  Venue? venue;
  double? regfee;
  int? maxParticpiants;
  String? img;
  String orgname = "";

  @override
  void initState() {
    super.initState();
    getUser().then((value) {
      setState(() {
        orgname = value;
      });
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      controller: _eventName,
                      cursorColor: const Color.fromARGB(255, 52, 34, 31),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 125, 123, 123),
                        hintText: 'Enter event name',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.all(20),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 52, 34, 31),
                              width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                      onEditingComplete: () {
                        name = _eventName.text;
                      },
                      onChanged: (value) {
                        name = value;
                      },
                      onFieldSubmitted: (value){
                        name=value;
                      },
                    ),
                  ),
                  createButton(
                      Colors.white,
                      Colors.brown,
                      Icons.event,
                      'Date',
                      () => selectDate(context, setDate, date),
                      date != null
                          ? "${date?.day.toString().padLeft(2, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.year}"
                          : null),
                  Row(
                    children: [
                      Expanded(
                        child: createButton(
                            Colors.white,
                            Colors.brown,
                            Icons.access_alarm,
                            'Start Time',
                            () => selectTime(context, setStartTime, start),
                            start != null
                                ? "Start: ${start?.format(context)}"
                                : null),
                      ),
                      Expanded(
                        child: createButton(
                            Colors.white,
                            Colors.brown,
                            Icons.access_alarm,
                            'End Time',
                            () => selectTime(context, setEndTime, end),
                            end != null
                                ? "End: ${end?.format(context)}"
                                : null),
                      ),
                    ],
                  ),
                  createButton(
                      Colors.brown, Colors.white, Icons.location_on, 'Venue',
                      () {
                    if (start != null && end != null && date != null) {
                      if (start!.compareTo(end!) < 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VenuePage(
                              start: start!,
                              end: end!,
                              date: date!,
                              changeStart: setStartTime,
                              changeEnd: setEndTime,
                              changeDate: setDate,
                              setVenue: setVenue,
                            ),
                          ),
                        );
                      }
                    }
                  }, venue?.name),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: _desc,
                      cursorColor: const Color.fromARGB(255, 52, 34, 31),
                      maxLines: 4,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 125, 123, 123),
                        hintText: 'Enter description',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.all(20),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 52, 34, 31),
                              width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                      onEditingComplete: () {
                        desc = _desc.text;
                      },
                      onChanged: (value) {
                        desc = value;
                      },
                      onSubmitted: (value){
                        desc=value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      controller: _eventName,
                      cursorColor: const Color.fromARGB(255, 52, 34, 31),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 125, 123, 123),
                        hintText: 'Add poster URL',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.all(20),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 52, 34, 31),
                              width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                      onEditingComplete: () {
                        img = _img.text;
                      },
                      onChanged: (value) {
                        img = value;
                      },
                      onFieldSubmitted: (value){
                        img=value;
                      },
                    ),
                  ),
                  createButton(
                      Colors.white,
                      Colors.brown,
                      Icons.add_circle_outline,
                      'Add more information',
                      () => moreInfo(
                          context, setRegFee, setMp, regfee, maxParticpiants),
                      null),
                  // createButton(Colors.brown, Colors.white, Icons.attach_file,
                  //     'Upload document', () => {}, null),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
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
                  onPressed: () {
                    print("$name $start $end $date ${venue?.name} $desc");
                    
                    if (name != null &&
                        start != null &&
                        end != null &&
                        date != null &&
                        venue != null &&
                        desc !=null &&
                        img != null
                        ) {
                          Event e = Event(name: name!, org: orgname, desc: desc!, approved: false, start: start!, end: end!, date: date!, venue: venue!.name, maxParticipants: maxParticpiants, regFee: regfee, status: "pending", img: img!);
                      e.addEvent();
                      Navigator.pop(context);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar
                      (content: Text('Fill all fields')));
                    }
                  },
                  child: Center(child: Text('Create Event')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setStartTime(TimeOfDay? p) {
    setState(() {
      start = p;
    });
  }

  void setEndTime(TimeOfDay? p) {
    setState(() {
      end = p;
    });
  }

  void setDate(DateTime? p) {
    setState(() {
      if (p!.isAfter(DateTime.now())) {
        date = p;
      }
    });
  }

  void setRegFee(double? f) {
    setState(() {
      regfee = f;
    });
  }

  void setMp(int? mp) {
    setState(() {
      maxParticpiants = mp;
    });
  }

  void setVenue(Venue? v) {
    setState(() {
      venue = v;
    });
  }
}
