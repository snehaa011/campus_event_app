import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

class AdminShimmerEventTile extends StatelessWidget {
  const AdminShimmerEventTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              height: 20,
              width: 100,
              borderRadius: 5,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ShimmerContainer(
                  height: 100,
                  width: 100,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ShimmerContainer(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 30,
                    borderRadius: 5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ShimmerContainer(
              width: MediaQuery.of(context).size.width - 30,
              height: 20,
            ),
            SizedBox(height: 10),
            ShimmerContainer(
              width: MediaQuery.of(context).size.width - 30,
              height: 20,
            ),
            SizedBox(height: 10),
            ShimmerContainer(
              width: MediaQuery.of(context).size.width - 30,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
