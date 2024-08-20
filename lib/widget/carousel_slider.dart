import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/Slide1.png',
    'assets/images/Slide2.png',
    'assets/images/Slide3.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.1,  // 10% of screen height
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imageList.map((item) => Container(
        child: Center(
          child: Image.asset(item, fit: BoxFit.cover, width: screenWidth),
        ),
      )).toList(),
    );
  }
}
