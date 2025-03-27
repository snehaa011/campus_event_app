// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

class StudentBottomBar extends StatefulWidget {
  Function func = () {};
  StudentBottomBar(Function f, {super.key}) {
    func = f;
  }
  @override
  State<StudentBottomBar> createState() => _StudentBottomBarState();
}

class _StudentBottomBarState extends State<StudentBottomBar> {
  int i = 0;
  void func(int x) {
    if (mounted) {
      setState(() {
        i = x;
      });
    }
    widget.func(x);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: dd,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => func(0),
            icon: i == 0
                ? Icon(
                    Icons.home,
                    color: d7,
                    size: 30,
                  )
                : Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            onPressed: () => func(1),
            icon: i == 1
                ? Icon(
                    Icons.event,
                    color: d7,
                    size: 30,
                  )
                : Icon(
                    Icons.event_outlined,
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            onPressed: () => func(2),
            icon: i == 2
                ? Icon(
                    Icons.notifications,
                    color: d7,
                    size: 30,
                  )
                : Icon(
                    Icons.notifications_outlined,
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            onPressed: () => func(3),
            icon: i == 3
                ? Icon(
                    Icons.account_circle,
                    color: d7,
                    size: 30,
                  )
                : Icon(
                    Icons.account_circle_outlined,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
