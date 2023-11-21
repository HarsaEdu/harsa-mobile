import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreenProvider with ChangeNotifier {
late  YoutubePlayerController _controller;

  VideoScreenProvider(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  YoutubePlayerController get controller => _controller;

  void play() {
    _controller.play();
    notifyListeners();
  }

  void pause() {
    _controller.pause();
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
