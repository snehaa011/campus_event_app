// ignore_for_file: must_be_immutable

import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

class EventSearchBar extends StatefulWidget {
  Function func = () {};

  EventSearchBar(Function f, {super.key}) {
    func = f;
  }

  @override
  State<EventSearchBar> createState() => _EventSearchBarState();
}

class _EventSearchBarState extends State<EventSearchBar> {
  TextEditingController tc = TextEditingController();
  void setQuery(String t) {
    widget.func(t);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tc,
      cursorColor: d7,
      style: TextStyle(
        color: d7,
      ),
      onChanged: (value) {
        setQuery(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: d5),
        ),
        fillColor: dd,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: d5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: d5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: d5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: d5),
        ),
        hintText: "Search",
        hintStyle: TextStyle(
          color: d5,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: d5,
        ),
      ),
    );
  }
}
