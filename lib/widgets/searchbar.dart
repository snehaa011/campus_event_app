// ignore_for_file: must_be_immutable

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
      onChanged: (value) {
        setQuery(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        fillColor: const Color.fromARGB(255, 199, 199, 199),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
