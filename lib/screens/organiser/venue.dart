import 'package:campus_event_app/data/sneha_test.dart';
import 'package:campus_event_app/widgets/organiser/datepicker.dart';
import 'package:campus_event_app/widgets/organiser/smallbutton.dart';
import 'package:campus_event_app/widgets/organiser/timepicker.dart';
import 'package:campus_event_app/widgets/organiser/venuetile.dart';
import 'package:campus_event_app/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class VenuePage extends StatefulWidget {
  final TimeOfDay start;
  final TimeOfDay end;
  final DateTime date;
  final Function(TimeOfDay?) changeStart;
  final Function(TimeOfDay?) changeEnd;
  final Function(DateTime?) changeDate;
  final Function(Venue?) setVenue;

  const VenuePage({
    required this.start,
    required this.end,
    required this.date,
    required this.changeStart,
    required this.changeEnd,
    required this.changeDate,
    required this.setVenue,
    Key? key,
  }) : super(key: key);

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  late List<Venue> list;
  late List<Venue> resultlist;
  late TimeOfDay start;
  late TimeOfDay end;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    start = widget.start;
    end = widget.end;
    date = widget.date;
    filter();
  }

  // i can give buttons only outside - simpler but not user friendly
  // if i give button where shd i chk if end>start - if both r set i cant choose a diff time easily because of the check
  // it will have to reset logically (think of the condition and do) bcoz of the error and then only i can choose a new time
  void setStartTime(TimeOfDay p) {
    widget.changeStart(p);
    setState(() {
      start = p;
    });
  }

  void setEndTime(TimeOfDay p) {
    widget.changeEnd(p);
    setState(() {
      end = p;
    });
  }

  void setDate(DateTime? p) {
    widget.changeDate(p);
    setState(() {
      if (p!.isAfter(DateTime.now())) {
        date = p;
      }
    });
  }

  void search(String str) {
    str = str.toLowerCase();
    Set<Venue> s = {};
    s.addAll(list.where((s) => s.name.toLowerCase().contains(str)).toList());
    setState(() {
      resultlist = s.toList();
    });
  }

  void filter() {
    Set<Venue> s = {};
    s.addAll(allvenue
        .where((v) => v.checkAvl(start, end, date)));
    setState(() {
      list = s.toList();
      resultlist = list;
      for (var v in resultlist) {
        print(v.name);
      }
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
          title: Text('Select venue')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: EventSearchBar(search),
              ),
              Row(
                children: [
                  Expanded(
                    child: createSmallButton(
                        Colors.white,
                        Colors.brown,
                        Icons.event,
                        'Date',
                        () => selectDate(context, setDate, date),
                        "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}"),
                  ),
                  Expanded(
                    child: createSmallButton(
                        Colors.white,
                        Colors.brown,
                        Icons.access_alarm,
                        'Start Time',
                        () => selectTime(context, setStartTime, start),
                        start.format(context)),
                  ),
                  Expanded(
                    child: createSmallButton(
                        Colors.white,
                        Colors.brown,
                        Icons.access_alarm,
                        'End Time',
                        () => selectTime(context, setEndTime, end),
                        end.format(context)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      onPressed: () {filter();},
                      child: Icon(Icons.check),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(2),
                          backgroundColor: const Color.fromARGB(255, 64, 49, 44),
                          foregroundColor:
                              const Color.fromARGB(255, 229, 229, 229)),
                    ),
                  )
                ],
              ),
              resultlist.isEmpty
                  ? Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Icon(
                            Icons.event_busy,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No venue available",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => VenueTile(
                          resultlist[index],
                          (start.compareTo(end) < 0),
                          widget.setVenue, date,
                          context),
                      itemCount: resultlist.length,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
