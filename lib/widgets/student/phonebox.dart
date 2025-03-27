// ignore_for_file: must_be_immutable
import 'package:campus_event_app/data/color.dart';
import 'package:flutter/material.dart';

class StudentPhoneBox extends StatelessWidget {
  late TextEditingController tc;
  Function func = () {};
  bool b = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StudentPhoneBox(TextEditingController t, Function f, this.b, {super.key}) {
    tc = t;
    func = f;
  }

  bool isNumeric(String str) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.length != 10 ||
              !isNumeric(value)) {
            return "Enter a valid phone number";
          }
          return null;
        },
        controller: tc,
        enabled: b,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white70),
        cursorColor: d7,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: d7,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: d7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onEditingComplete: () {
          if (_formKey.currentState!.validate()) {
            func(tc.text);
          }
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState!.validate()) {
            func(value);
          }
        },
      ),
    );
  }
}
