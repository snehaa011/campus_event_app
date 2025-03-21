import 'package:flutter/material.dart';

Widget createSmallButton(Color bg, Color fg, IconData i, String label,
    VoidCallback f, String? value) {
  return Container(
    height: 70,
    padding: EdgeInsets.all(3),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: bg,
        foregroundColor: fg,
        padding: EdgeInsets.all(2),
      ),
      onPressed: f,
      child: value == null
          ? Row(
              children: [
                Icon(
                  i,
                  size: 14,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(label),
                Text(value)
              ],
            ),
    ),
  );
}
