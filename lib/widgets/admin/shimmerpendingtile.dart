import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

class AdminShimmerPendingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: 130,
              height: 150,
              borderRadius: 5,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    width: 50,
                    height: 20,
                  ),
                  SizedBox(height: 8),
                  ShimmerContainer(
                    height: 50,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
