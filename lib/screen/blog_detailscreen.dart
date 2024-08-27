import 'package:flutter/material.dart';
import '../model/blog_model.dart';

class DetailScreen extends StatelessWidget {
  final BlogPost blogPost;
  final List<BlogPost> relatedBlogs; // Expecting relatedBlogs parameter

  const DetailScreen({
    required this.blogPost,
    required this.relatedBlogs, // This is the required parameter
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogPost.title,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Image.asset(
              blogPost.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),

            // Blog Post Title
            Text(
              blogPost.title,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // Blog Post Details with Poster Image and Name
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(blogPost.posterImageUrl),
                  radius: 20.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  'By ${blogPost.postedBy}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Spacer(),

                Text(
                  ' ${blogPost.category}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),

              ],
            ),
             const SizedBox(height: 8,),

            Row(
              children: [
                Text(
                  '${blogPost.date.toLocal().toShortString()}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${blogPost.views} views',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Blog Post Description
            Text(
              blogPost.description,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 16.0),

            // Additional Images Title
            Text(
              'More Images',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // PageView for additional images
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: PageView.builder(
                itemCount: blogPost.additionalImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      blogPost.additionalImages[index],
                      width: MediaQuery.of(context).size.width,

                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            // Related Blogs Section
            SizedBox(height: 24.0),
            Text(
              'Related Blogs',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // List of Related Blogs
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: relatedBlogs.length,
              itemBuilder: (context, index) {
                final relatedBlog = relatedBlogs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            blogPost: relatedBlog,
                            relatedBlogs: getRelatedBlogs(relatedBlog, fakeBlogPosts), // Pass related blogs again
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4.0,
                      child: ListTile(
                        leading: Image.asset(
                          relatedBlog.imageUrl,
                          fit: BoxFit.cover,
                          width: 75.0,
                          height: 50.0,
                        ),
                        title: Text(relatedBlog.title),
                        subtitle: Text('By ${relatedBlog.postedBy}',
                        style: Theme.of(context).textTheme.bodySmall,),
                      ),
                    ),
                  ),
                );
              },
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
