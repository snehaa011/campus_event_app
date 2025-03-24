import 'package:campus_event_app/data/eventmodel.dart';
import 'package:flutter/material.dart';

void dialogBox(context, List<Event> occupied) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrink to fit content
            children: [
              /// **Header Row with Title & Close Button**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Occupied Slots",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context), // Close dialog
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// **Event List**
              SizedBox(
                height: 300, // Scrollable area
                child: ListView.builder(
                  itemCount: occupied.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            occupied[index].name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "${occupied[index].start.format(context)} - ${occupied[index].end.format(context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 80, 80, 80)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
