import 'package:campus_event_app/widgets/student/shimmercontainer.dart';
import 'package:flutter/material.dart';

class StudentShimmerEventBox extends StatelessWidget {
  const StudentShimmerEventBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          title: StudentShimmerContainer(
            height: 20,
            borderRadius: 5,
          ),
          backgroundColor: const Color.fromARGB(255, 223, 223, 223),
          initiallyExpanded: true,
          collapsedBackgroundColor: const Color.fromARGB(255, 223, 223, 223),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StudentShimmerContainer(
                  height: 100,
                  width: 100,
                  borderRadius: 0,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: StudentShimmerContainer(
                    height: 100,
                    borderRadius: 0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            StudentShimmerContainer(
              height: 25,
              borderRadius: 5,
            ),
            SizedBox(
              height: 10,
            ),
            StudentShimmerContainer(
              height: 25,
              borderRadius: 5,
            ),
            SizedBox(
              height: 10,
            ),
            StudentShimmerContainer(
              height: 30,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
