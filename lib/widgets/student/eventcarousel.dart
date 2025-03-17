import 'package:campus_event_app/data/ashwin_test.dart';
import 'package:campus_event_app/widgets/student/populareventbox.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EventCarousel extends StatelessWidget {
  List<Event> list = [];
  EventCarousel(List<Event> l, {super.key}) {
    list = l;
  }

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
          child: StudentPopularEventBox(i),
        );
      }).toList(),
    );
  }
}
