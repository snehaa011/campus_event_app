import 'package:flutter/material.dart';

Future<void> selectDate(BuildContext context, Function(DateTime) setDate) async {
    DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  Color.fromARGB(255, 54, 44, 43), // header background color
              onPrimary: Color.fromARGB(255, 70, 63, 63), // header text color
              onSurface: Color.fromARGB(255, 97, 88, 88), // body text color
            ),
          ),
          child: child!,
        );
      },
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setDate(picked);
    }
  }