import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lms_project/main.dart';
import 'package:lms_project/model/video_model.dart';
import 'package:lms_project/utils/middleware/dio_api_handler/dio_api_handler.dart';

class VideoListingService {
  static Future<List<VideoDataModel>> getVideoList(
      {required int moduleId}) async {
    try {
      Response response =
          await dioApiCall().get("${apiRoutes.videos}$moduleId");
      if (response.statusCode == 200) {
        List data = jsonDecode(response.data);
        List<VideoDataModel> videos = [];
        for (Map element in data) {
          videos.add(VideoDataModel(
              id: element["id"],
              title: element["title"],
              description: element["description"],
              videoType: element["video_type"] == "YouTube"
                  ? VideoType.youtube
                  : VideoType.vimeo,
              videoUrl: element["video_url"]));
        }
        return videos;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
