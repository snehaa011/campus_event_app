// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StudentBottomBar extends StatelessWidget {
  late Function func = () {};
  StudentBottomBar(Function f, {super.key}) {
    func = f;
  }

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
              func(0),
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => {
              func(1),
            },
            icon: Icon(Icons.event),
          ),
          IconButton(
            onPressed: () => {
              func(2),
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () => {
              func(3),
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
