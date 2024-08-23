class Video {
  final String title;
  final String videoUrl;
  final String thumbnailUrl;

  Video({
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
  });
}

final List<Video> fakeVideos = [
  Video(
    title: 'Flutter Tutorial for Beginners',
    videoUrl: 'qU9mHegkTc4',
    thumbnailUrl: 'assets/images/flutter_ui.png',
  ),
  Video(
    title: 'Advanced Flutter Animations',
    videoUrl: 'ECaBebMKWaI',
    thumbnailUrl: 'assets/images/video2.jpg',
  ),
];