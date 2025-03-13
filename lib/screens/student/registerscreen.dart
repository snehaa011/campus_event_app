// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StudentRegisterScreen extends StatelessWidget {
  String title = "";
  StudentRegisterScreen(String t, {super.key}) {
    title = t;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
