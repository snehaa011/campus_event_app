import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/data/eventmodel.dart';
import 'package:campus_event_app/widgets/admin/participants.dart';
import 'package:flutter/material.dart';

class ViewEventPage extends StatefulWidget {
  final Event event;
  const ViewEventPage({required this.event, super.key});

  @override
  State<ViewEventPage> createState() => _ViewEventPageState();
}

class _ViewEventPageState extends State<ViewEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
        backgroundColor: d1,
        foregroundColor: d7,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: d7,
          ),
        ),
      ),
      backgroundColor: d1,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      widget.event.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.event.img,
                        // height: 500,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: const Color.fromARGB(242, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.desc,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: dd,
                        ),
                      ),
                      SizedBox(height: 15),
                      _buildInfoRow(Icons.location_on, widget.event.venue),
                      _buildInfoRow(Icons.access_time,
                          "${widget.event.start.format(context)} - ${widget.event.end.format(context)}"),
                      _buildInfoRow(Icons.calendar_today,
                          "${widget.event.date.day.toString().padLeft(2, '0')}-${widget.event.date.month.toString().padLeft(2, '0')}-${widget.event.date.year}"),
                      _buildInfoRow(Icons.people,
                          "Max Participants: ${widget.event.maxParticipants}"),
                      _buildInfoRow(Icons.person_outline,
                          "Registered: ${widget.event.participants?.length}"),
                      _buildInfoRow(Icons.money,
                          "Registration fees: ${widget.event.regFee}"),
                      _buildInfoRow(Icons.check_circle_outline,
                          "Status: ${widget.event.status.toUpperCase()}"),
                      SizedBox(height: 15),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            const Color.fromARGB(43, 121, 85, 72),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Participants(widget.event.name),
                            ),
                          ),
                        },
                        child: Text(
                          "View participants",
                          style: TextStyle(
                            fontSize: 16,
                            color: d1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: d6),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: dd),
            ),
          ),
        ],
      ),
    );
  }
}
