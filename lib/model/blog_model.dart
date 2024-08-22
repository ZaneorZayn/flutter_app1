import 'package:flutter/material.dart';

class BlogPost {
  final String title;
  final String imageUrl;
  final DateTime date;
  final int views;
  final String postedBy;
  final String posterImageUrl;

  BlogPost({
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.views,
    required this.postedBy,
    required this.posterImageUrl,
  });
}

List<BlogPost> fakeBlogPosts = [
  BlogPost(
    title: 'Exploring Flutter: A Deep Dive into Widgets',
    imageUrl: 'assets/images/flutter_widget.png',
    date: DateTime(2024, 8, 15),
    views: 1024,
    postedBy: 'John Doe',
    posterImageUrl: 'assets/images/john_doe.jpg',
  ),
  BlogPost(
    title: 'State Management in Flutter: A Complete Guide',
    imageUrl: 'assets/images/flutter_state.png',
    date: DateTime(2024, 8, 18),
    views: 980,
    postedBy: 'Jane Smith',
    posterImageUrl: 'assets/images/jane_smith.jpg',
  ),
  BlogPost(
    title: 'Creating Responsive UI in Flutter',
    imageUrl: 'assets/images/flutter_ui.png',
    date: DateTime(2024, 8, 20),
    views: 1200,
    postedBy: 'Emily Davis',
    posterImageUrl: 'assets/images/emily_davis.jpg',
  ),
  BlogPost(
    title: 'Flutter Animations: Making Your App Pop',
    imageUrl: 'assets/images/flutter_aniamtion.png',
    date: DateTime(2024, 8, 22),
    views: 1500,
    postedBy: 'Michael Brown',
    posterImageUrl: 'assets/images/michael_brown.jpg',
  ),
  BlogPost(
    title: 'Introduction to Dart: The Language Behind Flutter',
    imageUrl: 'assets/images/dart.jpg',
    date: DateTime(2024, 8, 25),
    views: 1120,
    postedBy: 'Sarah Johnson',
    posterImageUrl: 'assets/images/sarah_johnson.jpg',
  ),
];
