import 'package:flutter/material.dart';

class BlogPost {
  final String title;
  final String description; // Added description
  final String imageUrl;
  final List<String> additionalImages; // Added list of additional images
  final DateTime date;
  final int views;
  final String postedBy;
  final String posterImageUrl;

  BlogPost({
    required this.title,
    required this.description, // Added description
    required this.imageUrl,
    required this.additionalImages, // Added list of additional images
    required this.date,
    required this.views,
    required this.postedBy,
    required this.posterImageUrl,
  });
}

List<BlogPost> fakeBlogPosts = [
  BlogPost(
    title: 'Exploring Flutter: A Deep Dive into Widgets',
    description: 'In this blog, we explore the different types of widgets in Flutter and how they can be used to build dynamic, beautiful user interfaces.',
    imageUrl: 'assets/images/flutter_widget.png',
    additionalImages: [
      'assets/images/widget1.png',
      'assets/images/widget2.png',
      'assets/images/widget3.png',
    ],
    date: DateTime(2024, 8, 15),
    views: 1024,
    postedBy: 'John Doe',
    posterImageUrl: 'assets/images/john_doe.jpg',
  ),
  BlogPost(
    title: 'State Management in Flutter: A Complete Guide',
    description: 'This blog covers the various state management techniques available in Flutter, helping you choose the right one for your project.',
    imageUrl: 'assets/images/flutter_state.png',
    additionalImages: [
      'assets/images/flutter_state_1.png',
      'assets/images/flutter_state_2.png',
      'assets/images/flutter_state_3.png',
    ],
    date: DateTime(2024, 8, 18),
    views: 980,
    postedBy: 'Jane Smith',
    posterImageUrl: 'assets/images/jane_smith.jpg',
  ),
  BlogPost(
    title: 'Creating Responsive UI in Flutter',
    description: 'Learn how to create responsive user interfaces in Flutter that look great on any device, whether it\'s a phone, tablet, or desktop.',
    imageUrl: 'assets/images/flutter_ui.png',
    additionalImages: [
      'assets/images/flutter_ui_1.png',
      'assets/images/flutter_ui_2.png',
      'assets/images/flutter_ui_3.png',
    ],
    date: DateTime(2024, 8, 20),
    views: 1200,
    postedBy: 'Emily Davis',
    posterImageUrl: 'assets/images/emily_davis.jpg',
  ),
  BlogPost(
    title: 'Flutter Animations: Making Your App Pop',
    description: 'This blog dives into Flutter animations, showing you how to add smooth, engaging animations to your app to improve user experience.',
    imageUrl: 'assets/images/flutter_animation.png',
    additionalImages: [
      'assets/images/flutter_animation_1.png',
      'assets/images/flutter_animation_2.png',
      'assets/images/flutter_animation_3.png',
    ],
    date: DateTime(2024, 8, 22),
    views: 1500,
    postedBy: 'Michael Brown',
    posterImageUrl: 'assets/images/michael_brown.jpg',
  ),
  BlogPost(
    title: 'Introduction to Dart: The Language Behind Flutter',
    description: 'An introduction to Dart, the programming language that powers Flutter. Learn the basics of Dart and how it integrates with Flutter.',
    imageUrl: 'assets/images/dart.jpg',
    additionalImages: [
      'assets/images/dart_1.png',
      'assets/images/dart_2.png',
      'assets/images/dart_3.png',
    ],
    date: DateTime(2024, 8, 25),
    views: 1120,
    postedBy: 'Sarah Johnson',
    posterImageUrl: 'assets/images/sarah_johnson.jpg',
  ),
];
