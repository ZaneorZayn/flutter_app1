import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/allcontent_model.dart';
import '../model/blog_model.dart';
import '../model/q&a_model.dart';
import '../model/video_model.dart';
import '../widget/alltab.dart';
import '../widget/blogtab.dart';
import '../widget/mypost.dart';
import '../widget/q&atab.dart';
import '../widget/video_tab.dart';

class Blogscreen extends StatefulWidget {
  const Blogscreen({super.key});

  @override
  _BlogscreenState createState() => _BlogscreenState();
}

class _BlogscreenState extends State<Blogscreen> {
  int _selectedIndex = 0; // Tracks the currently selected tab

  final List<String> _tabs = [
    'All',
    'Blog',
    'Q&A',
    'Video',
    'My Post',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "All Content",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\nExplore good blogs and Q&A",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF49EC4),
                Color(0xFFF9C0C7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Material(
            elevation: 4.0, // Adds elevation to create a shadow
            shadowColor: Colors.black.withOpacity(0.3), // Controls the shadow color
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          backgroundColor: _selectedIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surface,
                          foregroundColor: _selectedIndex == index
                              ? Colors.white
                              : Theme.of(context).colorScheme.onSurface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Text(
                          _tabs[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: _buildTabContent(),
    );
  }

  // Build the content based on the selected tab
  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return AllTab();
      case 1:
        return BlogsTab();
      case 2:
        return QnATab();
      case 3:
        return VideoTab();
      case 4:
        return MyPostTab();
      default:
        return AllTab();
    }
  }
}

// Example widget for the QnA tab
class QnAWidget extends StatelessWidget {
  final QuestionAnswer qna;

  const QnAWidget({required this.qna});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              qna.question,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Answer: ${qna.answer}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Asked by ${qna.author}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// Example widget for the Video tab
class VideoWidget extends StatefulWidget {
  final Video video;

  const VideoWidget({required this.video});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.videoUrl, // Use the video ID here
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.video.title,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
