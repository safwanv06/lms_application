import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/main.dart';
import 'package:lms_project/model/video_model.dart';
import 'package:lms_project/screen/video/service/service.dart';
import 'package:lms_project/screen/video/view/widget/video_view_tile.dart';
import 'package:lms_project/utils/app_bar/custom_app_bar.dart';

import '../../../utils/loading_screen/loading_screen.dart';
import '../../../utils/no_data_page/no_data_page.dart';

class VideoListingView extends StatelessWidget {
  const VideoListingView(
      {super.key, required this.moduleId, required this.title});

  final int moduleId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: FutureBuilder(
        future: VideoListingService.getVideoList(moduleId: moduleId),
        builder: (context, AsyncSnapshot<List<VideoDataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding:
                  EdgeInsets.symmetric(vertical: appSizeConstants.padding_16.h),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                VideoDataModel videoData = snapshot.data![index];
                return VideoViewTile(
                  videoData: videoData,
                );
              },
            );
          } else {
            return const NoDataPage();
          }
        },
      ),
    );
  }
}
