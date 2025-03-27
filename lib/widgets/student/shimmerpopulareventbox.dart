import 'package:campus_event_app/data/color.dart';
import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

class StudentShimmerPopularEventBox extends StatelessWidget {
  const StudentShimmerPopularEventBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            decoration: BoxDecoration(
              color: dd,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerContainer(
                  height: 25,
                  borderRadius: 5,
                ),
                SizedBox(
                  height: 10,
                ),
                ShimmerContainer(
                  width: double.infinity,
                  height: 200,
                  borderRadius: 0,
                ),
                SizedBox(
                  height: 15,
                ),
                ShimmerContainer(
                  height: 50,
                  borderRadius: 5,
                ),
                SizedBox(
                  height: 15,
                ),
                ShimmerContainer(
                  height: 30,
                  borderRadius: 5,
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
