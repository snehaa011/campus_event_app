// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StudentPhoneBox extends StatelessWidget {
  late TextEditingController tc;
  Function func = () {};
  bool b = false;
  StudentPhoneBox(TextEditingController t, Function f, this.b, {super.key}) {
    tc = t;
    func = f;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 10) {
          return "Enter a valid phone number";
        }
        return null;
      },

      controller: tc,
      enabled: b,
      maxLength: 10,
      onEditingComplete: () {
        func(tc.text);
      },
      onFieldSubmitted: (value) {
        func(value);
      },
      // initialValue: user.phoneno,
      onTapOutside: (event) {
        func(tc.text);
      },
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
