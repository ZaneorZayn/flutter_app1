import 'package:flutter/material.dart';
import '../model/blog_model.dart';
import '../model/q&a_model.dart';
import '../model/video_model.dart';
import 'blogscreen.dart'; // Import the VideoWidget

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  // Define the searchContent function within the SearchScreen widget
  void searchContent(String query) {
    final List<BlogPost> blogResults = fakeBlogPosts.where((blog) {
      return blog.title.toLowerCase().contains(query.toLowerCase()) ||
          blog.description.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final List<QuestionAnswer> qnaResults = fakeQnA.where((qna) {
      return qna.question.toLowerCase().contains(query.toLowerCase()) ||
          qna.answer.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final List<Video> videoResults = fakeVideos.where((video) {
      return video.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _searchResults = [...blogResults, ...qnaResults, ...videoResults];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          onSubmitted: (query) {
            if (query.isNotEmpty) {
              searchContent(query);
            }
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _searchResults.isEmpty
          ? Center(child: Text('No results found.'))
          : ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final result = _searchResults[index];

          if (result is BlogPost) {
            return ListTile(
              title: Text(result.title),
              leading: Image.asset(result.imageUrl),
              onTap: () {
                // Navigate to blog post detail screen
              },
            );
          } else if (result is QuestionAnswer) {
            return QnAWidget(qna: result);
          } else if (result is Video) {
            return VideoWidget(video: result);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
