import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int reviewCount;

  StarRating({required this.rating, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStarIcons(rating),
        const SizedBox(width: 8),
        Text(
          '($reviewCount)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildStarIcons(double rating) {
    int fullStars = rating.floor(); // Number of full stars
    bool hasHalfStar = (rating - fullStars) >= 0.5; // Whether to show a half star
    int totalStars = 5; // Total number of stars to display

    List<Widget> stars = [];

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber, size: 20));
    }

    // Add half star if applicable
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 20));
    }

    // Add empty stars
    for (int i = stars.length; i < totalStars; i++) {
      stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 20));
    }

    return Row(children: stars);
  }
}