import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_project/main.dart';
import 'package:lms_project/model/modules_model.dart';
import 'package:lms_project/screen/modules/service/service.dart';
import 'package:lms_project/screen/modules/view/widget/module_view_tile.dart';
import 'package:lms_project/utils/app_bar/custom_app_bar.dart';
import 'package:lms_project/utils/loading_screen/loading_screen.dart';
import 'package:lms_project/utils/no_data_page/no_data_page.dart';

class ModulesListingView extends StatelessWidget {
  const ModulesListingView({super.key, required this.title,required this.subjectId});

  final int subjectId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, onBackPressed: () {
        Navigator.pop(context);
      },),
      body: FutureBuilder(
        future: ModulesService.getModules(subjectId: subjectId),
        builder: (context, AsyncSnapshot<List<ModulesDataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: appSizeConstants.padding_16.h),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                ModulesDataModel module = snapshot.data![index];
                return ModuleViewTile(module: module);
              },
            );
          } else {
            return const NoDataPage();
          }
        },
      ),
    );
  }
}
