import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/main.dart';
import 'package:lms_project/model/subject_model.dart';

import '../../../../utils/custom_image/custom_image.dart';
import '../../../modules/view/modules_listing_view.dart';

class SubjectViewTile extends StatelessWidget {
  const SubjectViewTile({super.key, required this.subject});

  final SubjectDataModel subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ModulesListingView(
                  subjectId: subject.id,
                  title: subject.subject,
                ),
              ));
        },
        child: Container(
          margin: EdgeInsets.all(appSizeConstants.padding_16.sp),
          padding: EdgeInsets.all(appSizeConstants.padding_8.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(appSizeConstants.radius_8),
            border: Border.all(
                width: 0.5.sp, color: appColors.color888693.withOpacity(0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSquareImage(
                imageType: ImageTypeModel.network,
                imageUrl: subject.image,
              ),
              SizedBox(
                height: appSizeConstants.padding_4.h,
              ),
              Text(
                subject.subject,
                style: fontStyles.text_14_500_120D26,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }
}
