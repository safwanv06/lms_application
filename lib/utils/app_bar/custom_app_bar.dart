import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.onBackPressed,
      this.elevation,
      this.noBackButton});

  final String title;
  final bool? noBackButton;
  final double? elevation;
  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appColors.colorFFFFFF,
      automaticallyImplyLeading: false,
      surfaceTintColor: appColors.colorFFFFFF,
      elevation: elevation ?? 0,
      leading: noBackButton != true
          ? Padding(
              padding: EdgeInsets.only(
                  left: appSizeConstants.padding_12.sp,
                  top: appSizeConstants.padding_12.sp),
              child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: onBackPressed,
                  child: Icon(
                    Icons.arrow_back,
                    color: appColors.color120D26,
                    size: appSizeConstants.size24.sp,
                  )),
            )
          : null,
      title: Padding(
        padding:  EdgeInsets.only(top: appSizeConstants.padding_12.h),
        child: Text(title,
            overflow: TextOverflow.ellipsis,
            style: fontStyles.text_24_500_120D26),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
