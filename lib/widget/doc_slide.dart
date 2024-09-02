import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DocSlide extends StatelessWidget {
  final List<String> Listimage = [
    'assets/images/doc_slide.png',
    'assets/images/doc_slide1.png',
    'assets/images/doc_slide2.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.25,  // Adjust the height as needed
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
      items: Listimage.map((item) => Container(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Apply border radius
            child: Image.asset(item, fit: BoxFit.cover, width: screenWidth),
          ),
        ),
      )).toList(),
    );
  }
}
