import 'package:flutter/material.dart';
import 'package:lms_project/screen/subjects/view/widget/app_bar.dart';
import 'package:lms_project/screen/subjects/view/widget/subject_view_tile.dart';
import 'package:lms_project/utils/loading_screen/loading_screen.dart';
import 'package:lms_project/utils/no_data_page/no_data_page.dart';

import '../../../model/subject_model.dart';
import '../service/service.dart';

class SubjectsListingView extends StatelessWidget {
  const SubjectsListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubjectAppBar(),
      body: FutureBuilder(
        future: SubjectsService.getSubjects(),
        builder: (context, AsyncSnapshot<List<SubjectDataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                SubjectDataModel subject = snapshot.data![index];
                return SubjectViewTile(
                  subject: subject,
                );
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
