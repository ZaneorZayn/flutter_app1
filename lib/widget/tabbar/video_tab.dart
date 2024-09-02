import 'package:flutter/material.dart';

import '../../model/video_model.dart';
import '../../screen/blogscreen.dart';

class VideoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: fakeVideos.length,
      itemBuilder: (context, index) {
        final video = fakeVideos[index];
        return VideoWidget(video: video);
      },
    );
  }
}