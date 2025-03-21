import 'package:flutter/material.dart';

Future<void> selectTime(BuildContext context, Function(TimeOfDay) setTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  Color.fromARGB(255, 82, 77, 77), // header background color
              onPrimary:
                  Color.fromARGB(255, 253, 253, 253), // header text color
              onSurface: Color.fromARGB(255, 24, 24, 24), // body text color
            ),
            timePickerTheme: TimePickerThemeData(
              dayPeriodColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? const Color.fromARGB(255, 148, 128, 120)
                    : const Color.fromARGB(255, 223, 223, 223),
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setTime(pickedTime);
    }
  }
