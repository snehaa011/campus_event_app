import 'package:flutter/material.dart';

Widget createButton(Color bg, Color fg, IconData i, String label, VoidCallback f, String? value) {
  return Container(
    height: 60,
    padding: EdgeInsets.all(6),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
        backgroundColor: bg,
        foregroundColor: fg,
        padding: EdgeInsets.all(1),
      ),
      onPressed: f,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [Icon(i), SizedBox(width:5,),  Text(
              value ?? label,
            ),],
          ),
        ],
      ),
    ),
  );
}
