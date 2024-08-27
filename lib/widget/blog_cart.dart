import 'package:flutter/material.dart';
import 'package:mobile_app/screen/blog_detailscreen.dart';
import '../model/blog_model.dart';

class BlogPostCard extends StatelessWidget {
  final BlogPost blogPost;

  BlogPostCard({required this.blogPost});

  @override
  Widget build(BuildContext context) {
    // Get the related blogs for this blog post
    List<BlogPost> relatedBlogs = getRelatedBlogs(blogPost, fakeBlogPosts);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              blogPost: blogPost,
              relatedBlogs: relatedBlogs, // Pass the related blogs
            ),
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
            handleBlogImage(blogPost.imageUrl, context),
            Padding(
              padding: const EdgeInsets.all(6.0),
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

Widget handleBlogImage(String? imageUrl, BuildContext context) {
  if (imageUrl != null && imageUrl.isNotEmpty) {
    // If the image URL is valid, return the image
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      errorBuilder: (context, error, stackTrace) {
        // Handle cases where the image fails to load
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.14,
          color: Colors.grey[300],
          child: Center(
            child: Icon(
              Icons.broken_image,
              size: 50,
              color: Colors.grey[600],
            ),
          ),
        );
      },
    );
  } else {
    // If the image URL is missing or empty, return a placeholder widget
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          size: 50,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}


