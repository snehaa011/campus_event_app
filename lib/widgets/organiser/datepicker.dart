import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

Future<void> selectDate(BuildContext context, Function(DateTime) setDate, DateTime? d) async {
    DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary:
                  d2, // header background color
              onPrimary: Color.fromARGB(255, 255, 255, 255), // header text color
              onSurface: d0, // body text color
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: d??DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setDate(picked);
    }
  }