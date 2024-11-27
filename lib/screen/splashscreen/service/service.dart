import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../subjects/view/subjects_listing_view.dart';

class SplashScreenService {
  static Future authStateCheck(BuildContext context) async {
    return Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SubjectsListingView(),
            ));
      },
    );
  }
}
