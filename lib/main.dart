import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/screen/splashscreen/view/splashscreen.dart';
import 'package:lms_project/screen/video_player/controller/controller.dart';
import 'package:lms_project/utils/api_routes/api_routes.dart';
import 'package:lms_project/utils/image_data/image_data.dart';
import 'package:lms_project/utils/middleware/shared_data_handler/shared_data_handler.dart';
import 'package:lms_project/utils/size_constants/app_size_constants.dart';
import 'package:lms_project/utils/theme/app_colors/app_colors.dart';
import 'package:lms_project/utils/theme/font_styles/font_styles.dart';
import 'package:provider/provider.dart';

AppSizeConstants appSizeConstants = AppSizeConstants();
ScreenUtil screenUtil = ScreenUtil();
SharedDataHandler sharedDataHandler = SharedDataHandler();
ApiRoutes apiRoutes = ApiRoutes();
ImageData imageData = ImageData();
AppColors appColors = AppColors();
FontStyles fontStyles = FontStyles();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => VideoPlayerController(),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            title: 'LMS App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: appColors.colorFFFFFF,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const SplashScreen(),
          ),
        ));
  }
}
