import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../model/video_model.dart';

class VideoPlayerController extends ChangeNotifier {
  YoutubePlayerController? youtubeController;
  double volume = 50;
  bool isPlaying = true;

  initialise({required VideoDataModel videoData}) {
      youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoData.videoUrl) ?? '',
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
      youtubeController!.setVolume(volume.toInt());
      notifyListeners();
  }

  void togglePlayPause() {
    isPlaying = !isPlaying;
      if (isPlaying) {
        youtubeController!.play();
      } else {
        youtubeController!.pause();
      }
    notifyListeners();
  }

  void setYoutubeVolume(double passedVolume) {
      volume = passedVolume;
      youtubeController!.setVolume(volume.toInt());
notifyListeners();
  }

  void seekForward() {
      final currentPosition = youtubeController!.value.position;
      youtubeController!.seekTo(currentPosition + const Duration(seconds: 10));
      notifyListeners();
  }

  void seekBackward() {
      final currentPosition = youtubeController!.value.position;
      youtubeController!.seekTo(
        currentPosition - const Duration(seconds: 10),
      );
      notifyListeners();
  }
}
