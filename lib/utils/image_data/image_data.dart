

class ImageData {
  ///base path
  static const String _imagePath = "assets/images";
  static const String _lottiePath = "assets/lottie";

  ///lottie
  String loadingLottie = "$_lottiePath/loading_lottie.json";
  String splashScreenLottie = "$_lottiePath/splash_screen_lottie.json";

  ///images and app logo


  ///exception handling images
  String noDataImage = "$_imagePath/image_not_found.png";
  String notFoundImage = "$_imagePath/no_data.png";
}
