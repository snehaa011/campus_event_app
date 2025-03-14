// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StudentBottomBar extends StatefulWidget {
  late Function func = () {};
  StudentBottomBar(Function f, {super.key}) {
    func = f;
  }

  @override
  State<StudentBottomBar> createState() => _StudentBottomBarState();
}

class _StudentBottomBarState extends State<StudentBottomBar> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => {
              setState(() {
                i = 0;
              }),
              widget.func(0),
            },
            icon: i == 0
                ? Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 30,
                  )
                : Icon(Icons.home_outlined),
          ),
          IconButton(
            onPressed: () => {
              setState(() {
                i = 1;
              }),
              widget.func(1),
            },
            icon: i == 1
                ? Icon(
                    Icons.event,
                    color: Colors.black,
                    size: 30,
                  )
                : Icon(Icons.event_outlined),
          ),
          IconButton(
            onPressed: () => {
              setState(() {
                i = 2;
              }),
              widget.func(2),
            },
            icon: i == 2
                ? Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  )
                : Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () => {
              setState(() {
                i = 3;
              }),
              widget.func(3),
            },
            icon: i == 3
                ? Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 30,
                  )
                : Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
