import 'package:flutter/material.dart';
import '../model/blog_model.dart';
import '../screen/blog_detailscreen.dart';
 // Import the DetailScreen

class BlogPostCard extends StatelessWidget {
  final BlogPost blogPost;

  BlogPostCard({required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the DetailScreen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(blogPost: blogPost),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 12.0),
        elevation: 4.0, // Adds a subtle shadow all around the card
        shadowColor: Colors.black.withOpacity(0.2), // Adjusts the shadow color and opacity
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Image.asset(
                blogPost.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                blogPost.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Posted by ${blogPost.postedBy} ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    '${blogPost.date.toLocal().toShortString()}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${blogPost.views} views',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension DateHelpers on DateTime {
  String toShortString() {
    return '${this.day}/${this.month}/${this.year}';
  }
}
