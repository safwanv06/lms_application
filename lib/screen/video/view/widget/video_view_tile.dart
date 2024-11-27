import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/model/video_model.dart';
import 'package:lms_project/screen/video_player/screen/video_player_view.dart';

import '../../../../main.dart';
import '../../../../utils/navigation_animation/navigation_animation.dart';

class VideoViewTile extends StatelessWidget {
  const VideoViewTile({super.key, required this.videoData});

  final VideoDataModel videoData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          navigateWithAnimation(context: context,targetPage: VideoPlayerView(videoData: videoData));
        },
        child: Container(
          margin: EdgeInsets.all(appSizeConstants.padding_8.sp),
          padding: EdgeInsets.all(appSizeConstants.padding_8.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(appSizeConstants.radius_8),
            border: Border.all(
                width: 0.5.sp, color: appColors.color888693.withOpacity(0.5)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoData.title,
                      style: fontStyles.text_14_500_120D26,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: appSizeConstants.padding_8.h,
                    ),
                    Text(
                      videoData.description,
                      style: fontStyles.text_12_300_888693,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
