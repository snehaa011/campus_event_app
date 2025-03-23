// ignore_for_file: must_be_immutable
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
        cursorColor: Colors.grey,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
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
