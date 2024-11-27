import 'package:flutter/material.dart';
import 'package:lms_project/main.dart';
import 'package:lottie/lottie.dart';

loadingScreen(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const LoadingScreen();
    },
  );
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Lottie.asset(imageData.loadingLottie),
    );
  }
}
