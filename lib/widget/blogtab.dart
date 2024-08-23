import 'package:flutter/material.dart';
import 'package:mobile_app/widget/blog_cart.dart';

import '../model/blog_model.dart';
import '../screen/blogscreen.dart';
class BlogsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: fakeBlogPosts.length,
      itemBuilder: (context, index) {
        final blog = fakeBlogPosts[index];
        return BlogPostCard(blogPost: fakeBlogPosts[index],);
      },
    );
  }
}