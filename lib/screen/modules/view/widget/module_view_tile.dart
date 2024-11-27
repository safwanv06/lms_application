import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/model/modules_model.dart';
import 'package:lms_project/screen/video/view/video_listing_view.dart';
import 'package:lms_project/utils/navigation_animation/navigation_animation.dart';
import '../../../../main.dart';

class ModuleViewTile extends StatelessWidget {
  const ModuleViewTile({super.key, required this.module});

  final ModulesDataModel module;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          navigateWithAnimation(
              context: context,
              targetPage: VideoListingView(
                moduleId: module.id,
                title: module.title,
              ));
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
                      module.title,
                      style: fontStyles.text_14_500_120D26,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: appSizeConstants.padding_8.h,
                    ),
                    Text(
                      module.description,
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
