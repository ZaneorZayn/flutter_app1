import 'package:flutter/material.dart';
import 'package:mobile_app/widget/blog_cart.dart';

import '../../model/allcontent_model.dart';
import '../../model/blog_model.dart';
import '../../model/q&a_model.dart';
import '../../model/video_model.dart';
import '../../screen/blogscreen.dart';

class AllTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: allContent.length,
      itemBuilder: (context, index) {
        final content = allContent[index];
        if (content.type == 'blog') {
          final BlogPost blog = content.data;
          return BlogPostCard(blogPost: fakeBlogPosts[index],);
        } else if (content.type == 'qna') {
          final QuestionAnswer qna = content.data;
          return QnAWidget(qna: qna);
        } else if (content.type == 'video') {
          final Video video = content.data;
          return VideoWidget(video: video);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}