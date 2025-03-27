import 'package:campus_event_app/widgets/shimmercontainer.dart';
import 'package:flutter/material.dart';

class StudentShimmerNotificationBox extends StatelessWidget {
  const StudentShimmerNotificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShimmerContainer(
                    width: 50,
                    height: 15,
                    borderRadius: 2,
                  ),
                  Spacer(),
                  ShimmerContainer(
                    width: 100,
                    height: 15,
                    borderRadius: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ShimmerContainer(
                height: 18,
                width: 2 * MediaQuery.of(context).size.width / 3,
                borderRadius: 2,
              ),
              SizedBox(
                height: 5,
              ),
              ShimmerContainer(
                height: 18,
                width: 100,
                borderRadius: 2,
              ),
              SizedBox(
                height: 5,
              ),
              ShimmerContainer(
                height: 60,
                width: double.infinity,
                borderRadius: 2,
              ),
              SizedBox(
                height: 5,
              ),
              ShimmerContainer(
                height: 20,
                width: 100,
                borderRadius: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
