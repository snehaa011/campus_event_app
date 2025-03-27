import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

Future<void> selectTime(BuildContext context, Function(TimeOfDay) setTime, TimeOfDay? t) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: d1,
              onPrimary:
                  Color.fromARGB(255, 253, 253, 253), // header text color
              onSurface: d0, // body text color
            ),
            timePickerTheme: TimePickerThemeData(
              dayPeriodColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Colors.blueGrey
                    : const Color.fromARGB(255, 223, 233, 233),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: t??TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setTime(pickedTime);
    }
  }
