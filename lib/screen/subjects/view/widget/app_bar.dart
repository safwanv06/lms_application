import 'package:flutter/material.dart';
import 'package:lms_project/main.dart';

class SubjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  SubjectAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Subjects",
        style: fontStyles.text_24_500_120D26,
      ),
    );
  }
}
