// ignore_for_file: must_be_immutable

import 'package:campus_event_app/widgets/student/shimmerpopulareventbox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StudentShimmerCarousel extends StatelessWidget {
  List list = [1, 2, 3];

  StudentShimmerCarousel({super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 600,
        autoPlay: true,
        enlargeCenterPage: false,
      ),
      items: list.map((i) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: StudentShimmerPopularEventBox(),
        );
      }).toList(),
    );
  }
}
