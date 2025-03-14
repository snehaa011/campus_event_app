import 'package:flutter/material.dart';

class StudentFilter extends StatelessWidget {
  const StudentFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => {},
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              CircleBorder(),
            ),
          ),
          child: Text("text"),
        ),
      ),
      itemCount: 7,
      scrollDirection: Axis.horizontal,
    );
  }
}
