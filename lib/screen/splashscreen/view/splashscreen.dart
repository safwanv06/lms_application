import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';
import '../service/service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SplashScreenService.authStateCheck(context),
        builder: (context, AsyncSnapshot snapshot) {
          return Container(
            height: screenUtil.screenHeight,
            width: screenUtil.screenWidth,
            color: Colors.white,
            child: Center(
                child: Lottie.asset(imageData.splashScreenLottie,
                    height: screenUtil.screenHeight / 4,
                    fit: BoxFit.fitHeight)),
          );
        },
      ),
    );
  }
}
