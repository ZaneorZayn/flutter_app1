import 'package:mobile_app/model/q&a_model.dart';
import 'package:mobile_app/model/video_model.dart';

import 'blog_model.dart';

class Content {
  final String type; // Can be 'blog', 'qna', 'video'
  final dynamic data;

  Content({
    required this.type,
    required this.data,
  });
}

// Combine All Content for the "All" Tab
final List<Content> allContent = [
  Content(type: 'blog', data: fakeBlogPosts[0]),
  Content(type: 'qna', data: fakeQnA[0]),
  Content(type: 'video', data: fakeVideos[0]),
  Content(type: 'blog', data: fakeBlogPosts[1]),
  Content(type: 'qna', data: fakeQnA[1]),
  Content(type: 'video', data: fakeVideos[1]),
];
