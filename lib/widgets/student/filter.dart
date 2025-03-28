// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

class StudentFilter extends StatelessWidget {
  Function func = () {};
  StudentFilter(Function f, {super.key}) {
    func = f;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => {func(org[index])},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(d6),
            shape: WidgetStatePropertyAll(
              CircleBorder(),
            ),
          ),
          child: Text(
            org[index],
            style: TextStyle(
              color: d1,
            ),
          ),
        ),
      ),
      itemCount: org.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
