import 'package:flutter/material.dart';
import 'package:lms_project/utils/loading_screen/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

import '../../../model/video_model.dart';
import '../../../utils/app_bar/custom_app_bar.dart';
import '../controller/controller.dart';

class VideoPlayerView extends StatelessWidget {
  VideoPlayerView({super.key, required this.videoData});

  final VideoDataModel videoData;

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoPlayerController>(builder: (context, value, child) {
      if (value.youtubeController == null &&
          videoData.videoType == VideoType.youtube) {
        value.initialise(videoData: videoData);
      }
      return Scaffold(
        appBar: CustomAppBar(
          title: videoData.title,
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: videoData.videoType == VideoType.youtube
            ? value.youtubeController != null
                ? Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: YoutubePlayer(
                            controller: value.youtubeController!,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.replay_10),
                            onPressed: () {
                              value.seekBackward();
                            },
                          ),
                          IconButton(
                            icon: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                            onPressed: value.togglePlayPause,
                          ),
                          IconButton(
                            icon: const Icon(Icons.forward_10),
                            onPressed: () {
                              value.seekForward();
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            const Icon(Icons.volume_down),
                            Expanded(
                              child: Slider(
                                value: value.volume,
                                min: 0,
                                max: 100,
                                divisions: 10,
                                label: "${value.volume.toInt()}",
                                onChanged: (volume) {
                                  value.setYoutubeVolume(volume);
                                },
                              ),
                            ),
                            const Icon(Icons.volume_up),
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(child: LoadingScreen())
            : Center(
                child: VimeoPlayer(
                  videoId: videoData.videoUrl.split("/").last,
                ),
              ),
      );
    });
  }
}
