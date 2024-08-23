import 'package:flutter/material.dart';

import '../model/blog_model.dart';

class DetailScreen extends StatelessWidget {
  final BlogPost blogPost;

  const DetailScreen({required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogPost.title,
        style: Theme.of(context).textTheme.displayMedium,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Image.asset(
              blogPost.imageUrl,
              width: MediaQuery.of(context).size.width,
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

            // Blog Post Details
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                CircleAvatar(
                  backgroundImage: AssetImage(blogPost.posterImageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10,),
                Text(
                  'By ${blogPost.postedBy}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),

              ],
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
                Text(
                  '${blogPost.date.toLocal().toIso8601String().substring(0, 10)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 8,),
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

            // Additional Images
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More Images',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),

            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              ),
              height: MediaQuery.of(context).size.height * 0.35,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogPost.additionalImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      blogPost.additionalImages[index],
                      width: MediaQuery.of(context).size.width ,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}

