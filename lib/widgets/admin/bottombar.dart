import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminBottomBar extends StatefulWidget {
  late Function func = () {};
  AdminBottomBar(Function f, {super.key}) {
    func = f;
  }
  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
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
        ],
      ),
    );
  }
}
