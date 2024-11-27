class VideoDataModel {
  VideoDataModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.videoType,
      required this.videoUrl});

  int id;
  String title;
  String description;
  VideoType videoType;
  String videoUrl;
}

enum VideoType { youtube, vimeo }
